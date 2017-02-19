%  Procedure for setting the center point for the focusing.
%  This point is used as a reference for calculating the
%  focusing delay times and as a starting point for dynamic
%  focusing.
%
%  Calling:  xdc_center_focus (Th, point); 
%
%  Parameters:  Th     - Pointer to the transducer aperture.  
%               point  - Focus center point.
%
%  Return:      none.
%
%  Version 1.0, May 20, 1997 by Joergen Arendt Jensen

function res = xdc_center_focus (Th,point)

%  Check the point array

  [m2,n]=size(point);
  if (n ~= 3)
    error ('Point array must have three columns');
    end

%  Check both arrays

  if (m2 ~= 1)
    error ('There must only be one row for the center point');
    end

%  Call the C-part of the program to insert focus

   Mat_field (1063,Th,point);


