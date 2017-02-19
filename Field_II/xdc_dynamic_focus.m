%  Procedure for using dynamic focusing for an aperture
%
%  Calling:  xdc_dynamic_focus (Th, time, dir_zx,dir_zy); 
%
%  Parameters:  Th        - Pointer to the transducer aperture.  
%               time      - Time after which the dynamic focus is valid. 
%               dir_zx    - Direction (angle) in radians for the dynamic
%                           focus. The direction is taken from the center for
%                           the focus of the transducer in the z-x plane.
%               dir_zy    - Direction (angle) in radians for the dynamic
%                           focus. The direction is taken from the center for
%                           the focus of the transducer in the z-y plane.
%
%  Return:      none.
%
%  Version 1.02, March 19, 1998 by Joergen Arendt Jensen

function res = xdc_dynamic_focus (Th,time,dir_zx,dir_zy)

%  Check the times vector

  [m1,n]=size(time);
  if ((n ~= 1) & (m1 ~= 1)) 
    error ('Time must be a scalar');
    end

%  Check the direction

  [m1,n]=size(dir_zx);
  if ((n ~= 1) & (m1 ~= 1)) 
    error ('Direction must be a scalar');
    end

%  Check the direction

  [m1,n]=size(dir_zy);
  if ((n ~= 1) & (m1 ~= 1)) 
    error ('Direction must be a scalar');
    end

%  Call the C-part of the program to insert focus

   Mat_field (1062,Th,time,dir_zx,dir_zy);


