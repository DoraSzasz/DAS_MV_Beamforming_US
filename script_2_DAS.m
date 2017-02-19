%  The program takes the data from 'rf-raw' folder and makes
%  DAS beamforming

clear all

load ('probe_data/probeUS.mat');

%%  Define the weights
apo = hamming(img.n_active);
img.d_teta=img.sector/(img.n_lines-1);

%%  Read raw data and sum it
for k=1:img.n_lines
    display(['Line no.',num2str(k),'...']);
    cmd=['load results/indiv_scat/line',num2str(k),'.mat'];
    eval(cmd);
        
    for l=1:img.n_active
        y_win(l,:) = apo(l)*v_short(:,l);
    end
    %   DAS
    final(1:max(size(y_win)),k) = sum(y_win,1);
    t1_array(k) = t_start;
    
    clear y_win
end
%%  Normalization of the image
final = final / max(max(final));

for i = 1:img.n_lines
    final_t1(fix(t1_array(i)*img.fs):(fix(t1_array(i)*img.fs)+size(final,1)-1),i) = ...
        final(:,i);
    
end

%%
%  Do logarithmic compression
dB_range=60;  % Dynamic range for display in dB

disp('Finding the envelope')
log_env=20*log10(abs(hilbert(final_t1)));
log_env=log_env+dB_range;

% Interpolation
ID=20;
[n,m]=size(log_env);
new_env=zeros(n,m*ID);
for i=1:n
    new_env(i,:)=interp(log_env(i,:),ID);
end
[n,m]=size(new_env);
  
fn=img.fs/10;

clf
d_x=probe.width+probe.kerf;
image(((1:(ID*img.n_lines-1))*d_x/ID-img.n_lines*d_x/2)*1000,((1:n)/img.fs)*1540/2*1000,log_env)
xlabel('Lateral distance [mm]')
ylabel('Axial distance [mm]')
colormap(gray(60))
axis('image')
axis([-6 6 35 75])

profil_ligne = 20*log10(abs(hilbert(final_t1)));
figure;plot(profil_ligne(2623,:))
figure;plot(profil_ligne(3662,:))