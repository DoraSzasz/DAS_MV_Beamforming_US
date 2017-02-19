%  Procedure for setting the delay of individual
%  mathematical elements making up the transducer
%
%  Calling:  ele_delay (Th, element_no, delays); 
%
%  Parameters:  Th          - Pointer to the transducer aperture.  
%               element_no  - Column vector with one integer for each physical 
%                             element to set delay for.
%               delays      - Delay values. Matrix with one row for each
%                             physical element and a number of columns equal to the 
%                             number of mathematical elements in the aperture. 
%
%  Return:      none.
%
%  Version 1.0, June 29, 1998 by Joergen Arendt Jensen

function res = ele_delay (Th, element_no, delays)

%  Check the element number vector

  [m1,n]=size(element_no);
  if (n ~= 1) 
    error ('Element_no vector must have one column');
    end

  [m2,n]=size(delays);

%  Check both arrays

  if (m1 ~= m2)
    error ('There must be the same number of rows for element_no vector and delays matrix');
    end

%  Call the C-part of the program to insert apodization

   Mat_field (1081, Th, element_no, delays);


