%  Procedure for calculating the received signal from a collection of scatterers.
%
%  Calling:  [scat, start_time] = calc_scat(Th1, Th2, points, amplitudes); 
%
%  Parameters:  Th1        - Pointer to the transmit aperture.  
%               Th2        - Pointer to the receive aperture.  
%               points     - Scatterers. Vector with three columns (x,y,z) 
%                            and one row for each scatterer. 
%               amplitudes - Scattering amplitudes. Row vector with one 
%                            entry for each scatterer.
%
%  Return:      scat       - Received voltage trace.
%               start_time - The time for the first sample in scat.
%
%  Version 1.0, November 28, 1995 by Joergen Arendt Jensen

function [scat, start_time] = calc_scat (Th1, Th2, points, amplitudes)

%  Check the point array

  [m1,n]=size(points);
  if (n ~= 3)
    error ('Points array must have three columns');
    end
  [m2,n]=size(amplitudes);
  if (m1 ~= m2)
    error ('There must be the same number of rows for points and amplitudes arrays');
    end

%  Call the C-part of the program to show aperture

  [scat, start_time] = Mat_field (4005,Th1,Th2,points, amplitudes);


