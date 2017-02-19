%  Procedure for creating a focus time line for an aperture
%  The user here supplies the delay times for each element
%
%  Calling:  xdc_times_focus (Th, times, delays); 
%
%  Parameters:  Th     - Pointer to the transducer aperture.  
%               times  - Time after which the associated apodization is valid. 
%               delays - Delay values. Matrix with one row for each
%                        time value and a number of columns equal to the 
%                        number of physical elements in the aperture. 
%
%  Return:      none.
%
%  Version 1.1, March 3, 1998 by Joergen Arendt Jensen

function res = xdc_focus_times (Th,times,delays)

%  Check the times vector

  [m1,n]=size(times);
  if (n ~= 1) 
    error ('Times vectors must have one columns');
    end

  [m2,n]=size(delays);

%  Check both arrays

  if (m1 ~= m2)
    error ('There must be the same number of rows for times and delays');
    end

%  Call the C-part of the program to insert focus

   Mat_field (1061,Th,times,delays);


