clear all
close all
clc
%==========================================================================
load ('probe_data/probeUS.mat');

sub_arr_L = img.n_active;             %  Sub array length in spatial smoothing
N_weight = sub_arr_L;               %  Size of the apodization weights vector when applying spatial smoothing
a = ones(N_weight,1);               % Array steering vector
num_sub_arr = img.n_active-sub_arr_L+1; % Number of sub arrays in spatial smoothing
SNAPSHOT_NO = 1;                    %  Number of snapshots used to compute the spatial correlation matrix
%==========================================================================
for i=1:img.n_lines
    tmpTime = cputime;
    rf_line_i = i;
    
  %  Load the simulated rf-lines
    cmd=['load results/indiv_scat/line',num2str(i),'.mat'];
    eval(cmd);
    
    for l=1:img.n_active
        line_short = v_short(:,l);
        pline_short(:,l) = v_short(:,l).*v_short(:,l); %CF
    end
    
    %% Apply CF (coherence factor)
    %   Calculate the CF factor
    numitor_cf(1:max(size(pline_short)),i) = img.n_active*sum(pline_short,2); %CF
    numarator_cf(1:max(size(v_short)),i) = sum(v_short,2).*sum(v_short,2); %CF
    cf(1:max(size(v_short)),i) = numarator_cf(1:max(size(v_short)),i)./numitor_cf(1:max(size(pline_short)),i);
    cf(isnan(cf)) = 0;
    
    %   Apply the CF factor to our data
    for p=1:img.n_active
        v_short(1:max(size(v_short)),p) = cf(1:max(size(v_short)),i).*v_short(:,p);
    end
    %% end #Apply CF
    
  %  Add white gaussian noise, SNR=60 dB
  %  Resets the state of the normal random number generator
%   v_short = awgn(v_short,60,'measured',0);
%==========================================================================
    [L,v,Rpre,Rpre_i,buffill,dataset] = Init(v_short,N_weight,SNAPSHOT_NO);
    for apo_i = 1:L
   %============================================
           u = v_short(apo_i,1:img.n_active);
           u = u(:);
   %============================================
      [R,Rpre,Rpre_i,buffill,dataset] = CalculateSpatiallySmoothedR(u,N_weight,num_sub_arr,Rpre,Rpre_i,buffill,dataset,SNAPSHOT_NO);
      
      %%  Diagonal Loading Parameter
      delta = 1/N_weight;
      R = R +(delta*trace(R))*eye(N_weight);
      Ri = inv(R);
      w = Ri*a/(a'*Ri*a);
      v(apo_i) = CalculateV(u,w,N_weight,num_sub_arr);
      v(isnan(v))=0;
     end
%==========================================================================
  %  Find the envelope
  v = v(:);
  final(1:max(size(v_short)),i) = v;
  t1_array(i) = t_start;
  v_short = [];
  pline_short = [];
  timePerLine = cputime - tmpTime;
  disp(['Time taken: ' num2str(timePerLine/60) ' min']);
end

%%  Normalization of the image
final = final / max(max(final));

for i = 1:img.n_lines
    final_t1(fix(t1_array(i)*img.fs):(fix(t1_array(i)*img.fs)+size(final,1)-1),i) = ...
        final(:,i);
    
end

cmd=['save results/resultMVDR.mat final_t1']; %save the BFed image
eval(cmd);

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
  
fn=img.fs;

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