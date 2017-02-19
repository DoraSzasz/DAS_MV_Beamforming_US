%  Procedure for calculating the spatial impulse response
%  for an aperture.
%
%  Calling:  [h, start_time] = calc_h(Th,points); 
%
%  Parameters:  Th     - Pointer to the transducer aperture.  
%               points - Field points. Vector with three columns (x,y,z) 
%                        and one row for each field point. 
%
%  Return:      h          - Spatial impulse response in m/s.
%               start_time - The time for the first sample in h.
%
%  Version 1.01, October 4, 1996 by Joergen Arendt Jensen

function [h, start_time] = calc_h (Th,points)

%  Check the point array

  [m,n]=size(points);
  if (n ~= 3)
    error ('Points array must have three columns');
    end

%  Call the C-part of the program to show aperture

  [h, start_time] = Mat_field (4001,Th,points);


