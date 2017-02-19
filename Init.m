function [L,v,Rpre,Rpre_i,buffill,dataset] = Init(v1,N_weight,SNAPSHOT_NO)

    L = max(size(v1));
    v = zeros(L,1);
    Rpre = zeros(N_weight,N_weight,SNAPSHOT_NO);      % buffer to save the spatial smoothed correlation matrix
    Rpre_i = 1;      % Rpre buffer pointer
    buffill = 0;     % Rpre buffer flag indicating if the buffer is full or not
    dataset = 1;     % 
end