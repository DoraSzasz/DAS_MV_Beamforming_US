%  Procedure for calculating the pulse echo field.
%
%  Calling:  [hhp, start_time] = calc_hhp(Th1, Th2, points); 
%
%  Parameters:  Th1    - Pointer to the transmit aperture.  
%               Th2    - Pointer to the receive aperture.  
%               points - Field points. Vector with three columns (x,y,z) 
%                        and one row for each field point. 
%
%  Return:      hhp        - Received voltage trace.
%               start_time - The time for the first sample in hhp.
%
%  Version 1.0, November 22, 1995 by Joergen Arendt Jensen

function [hhp, start_time] = calc_hhp (Th1, Th2, points)

%  Check the point array

  [m,n]=size(points);
  if (n ~= 3)
    error ('Points array must have three columns');
    end

%  Call the C-part of the program to show aperture

  [hhp, start_time] = Mat_field (4003,Th1,Th2,points);


