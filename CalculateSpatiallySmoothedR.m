function [R,Rpre,Rpre_i,buffill,dataset] = CalculateSpatiallySmoothedR(u,N_weight,num_sub_arr,Rpre,Rpre_i,buffill,dataset,SNAPSHOT_NO)

    %  Calculate the spatial correlation matrix
    R = zeros(N_weight,N_weight);
    for apo_m = 1:num_sub_arr
      R = R + u(apo_m:apo_m+N_weight-1)*u(apo_m:apo_m+N_weight-1)';        
    end
    R = R/num_sub_arr; 
    if SNAPSHOT_NO~=0
      Rpre(:,:,Rpre_i) = R;
      if Rpre_i == SNAPSHOT_NO  
        Rpre_i = 1;                                   % reset the buffer pointer
        buffill = 1;                                  % buffer is full
        dataset = SNAPSHOT_NO;                        % number of snapshots used to calculate correlation matrix 
      else  
        Rpre_i = Rpre_i + 1;
      end
      if buffill== 0 
        dataset = Rpre_i-1 ;                            
      end
      %  Average the past SNAPSHOT_NO spatial smoothed correlation matrix
      %  SNAPSHOT_NO is max 2 or 3, 
      %  otherwise this for loop averaging is not very efficient.
      R = zeros(N_weight,N_weight);
      for i = 1:dataset
        R = R + Rpre(:,:,i);
      end
      R = R/dataset;
    end
end