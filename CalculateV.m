% calculate the beamformer output

function v = CalculateV(u,w,N_weight,num_sub_arr)

    v = 0;
    for i = 1:num_sub_arr
      v = v + u(i:i+N_weight-1);   
    end
    v = w'*v;
    v = v/num_sub_arr;
end
