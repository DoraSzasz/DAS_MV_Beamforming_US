%  Procedure for setting the apodization of individual
%  mathematical elements making up the transducer
%
%  Calling:  ele_apodization (Th, element_no, apo); 
%
%  Parameters:  Th          - Pointer to the transducer aperture.  
%               element_no  - Column vector with one integer for each physical 
%                             element to set apodization for.
%               apo         - Apodization values. Matrix with one row for each
%                             physical element and a number of columns equal to the 
%                             number of mathematical elements in the aperture. 
%
%  Return:      none.
%
%  Version 1.0, June 29, 1998 by Joergen Arendt Jensen

function res = ele_apodization (Th, element_no, apo)

%  Check the element number vector

  [m1,n]=size(element_no);
  if (n ~= 1) 
    error ('Element_no vector must have one column');
    end

  [m2,n]=size(apo);

%  Check both arrays

  if (m1 ~= m2)
    error ('There must be the same number of rows for element_no vector and apo matrix');
    end

%  Call the C-part of the program to insert apodization

   Mat_field (1080, Th, element_no, apo);


