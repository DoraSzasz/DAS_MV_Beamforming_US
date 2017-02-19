clc;
close all;
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DESCRIPTION:
% given the scatter maps in the scattdata folder, an echo image is
% simulated with FieldII
% results are stored in the 'results'.
% DO NOT FORGET TO CHANGE THE PATH TO FIELD II
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addpath('Field_II');


% -- scattdata - 14 individual reflectors (positions,amplitudes)
% -- results - the folder where we put the results
readFolder = 'scattdata/';
writeFolder = 'results/';
load ('probe_data/probeUS.mat');

disp('--> Probe setting loaded')

%-- Initialize Field simulator
field_init;

%-- set the sampling frequency for Field II
set_sampling(img.fs);  

%-- Generate aperture for transmit
tx_aperture = xdc_linear_array (probe.n_elements, probe.width, ...
    probe.element_height, probe.kerf, probe.n_sub_x, probe.n_sub_y, probe.focus); 

%-- Generate aperture for reception
rx_aperture = xdc_linear_array (probe.n_elements, probe.width, ...
    probe.element_height, probe.kerf, probe.n_sub_x, probe.n_sub_y, probe.focus); 

%-- Set the impulse response for the transmit aperture
xdc_impulse (rx_aperture, probe.impulse_response);   

%-- Set the impulse response for the receive aperture
xdc_impulse (tx_aperture, probe.impulse_response);   

%--  Set the impulse response and excitation of the xmit aperture
xdc_excitation (tx_aperture, img.excitation);        

img.teta_start = -img.sector/2;
img.d_teta=img.sector/(img.n_lines-1);

filelist = what(readFolder);
filelist = filelist.mat;

fname = [readFolder 'pht_data.mat'];
load(fname);

if ~exist([writeFolder '/indiv_scat'])
    mkdir([writeFolder '/indiv_scat']);
end

%-- Loop for each line
tic;
for i=1:img.n_lines
    
    if ~exist([writeFolder '/indiv_scat/line',num2str(i),'.mat'])
        disp(['processing line ' num2str(i) '/' num2str(img.n_lines)])
        %-- position of coordinate system for calculation of focus in tx
        xdc_center_focus(tx_aperture,[0 0 0]);

        %-- position of coordinate system for calculation of focus in rx
        xdc_center_focus(rx_aperture,[0 0 0]);
        teta = img.teta_start+(i-1)*img.d_teta;

        %-- transmit focus
        if (img.tx_dynamic_focus==1)
            xdc_dynamic_focus (tx_aperture, 0, teta,0);
        else
            xdc_focus (tx_aperture,img.tx_focus_times,[img.tx_focal_zones*sin(teta) zeros(size(img.tx_focal_zones)) img.tx_focal_zones*cos(teta)]);
        end
        %-- receive focus
        if (img.rx_dynamic_focus==1)
            xdc_dynamic_focus (rx_aperture, 0, teta,0);
        else
            xdc_focus (rx_aperture,img.rx_focus_times,[img.rx_focal_zones*sin(teta) zeros(size(img.rx_focal_zones)) img.rx_focal_zones*cos(teta)]);
        end    

        %-- transmit apodization
        if (img.tx_cst_apo==0)
            xdc_apodization (tx_aperture,img.tx_apo_times,img.tx_apo_vector);
        else
            xdc_apodization (tx_aperture, 0, img.tx_apo_vector);
        end
        %-- receive apodization
        if (img.rx_cst_apo==0)
            xdc_apodization (tx_aperture,img.rx_apo_times,img.rx_apo_vector);
        else
            xdc_apodization (rx_aperture, 0, img.rx_apo_vector);
        end    

        [rf_data,t_start] = calc_scat_multi(tx_aperture,rx_aperture,phantom_positions,phantom_amplitudes);
        v_short = rf_data;

        %-- Store the result
        lineNumber = i;
        save([writeFolder '/indiv_scat/line',num2str(i),'.mat'], 'v_short','lineNumber', 't_start');
        else
        disp(['skipping line ' num2str(i) '/' num2str(img.n_lines)])
        end
end

disp(['SIMULATION FINISHED']);
disp(['ELAPSED TIME = ' num2str(toc)]);


