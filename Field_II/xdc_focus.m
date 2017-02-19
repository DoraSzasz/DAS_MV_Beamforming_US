%  Procedure for creating a focus time line for an aperture
%
%  Calling:  xdc_focus (Th, times, points); 
%
%  Parameters:  Th     - Pointer to the transducer aperture.  
%               times  - Time after which the associated focus is valid. 
%               points - Focus points. Vector with three columns (x,y,z) 
%                        and one row for each field point.
%
%  Return:      none.
%
%  Version 1.0, November 28, 1995 by Joergen Arendt Jensen

function res = xdc_focus (Th,times,points)

%  Check the times vector

  [m1,n]=size(times);
  if (n ~= 1) 
    error ('Times vectors must have one columns');
    end

%  Check the point array

  [m2,n]=size(points);
  if (n ~= 3)
    error ('Points array must have three columns');
    end

%  Check both arrays

  if (m1 ~= m2)
    error ('There must be the same number of rows for times and focal points');
    end

%  Call the C-part of the program to insert focus

   Mat_field (1060,Th,times,points);


