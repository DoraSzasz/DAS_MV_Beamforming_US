%  Procedure for setting the waveform of individual
%  physical elements of the transducer
%
%  Calling:  ele_waveform (Th, element_no, samples); 
%
%  Parameters:  Th          - Pointer to the transducer aperture.  
%               element_no  - Column vector with one integer for each physical 
%                             element to set waveform for.
%               samples     - Sample values for waveform. Matrix with one row for each
%                             physical element and a number of columns equal to the 
%                             number of samples in the waveforms. 
%
%  Return:      none.
%
%  Version 1.0, July 1, 1998 by Joergen Arendt Jensen

function res = ele_waveform (Th, element_no, samples)

%  Check the element number vector

  [m1,n]=size(element_no);
  if (n ~= 1) 
    error ('Element_no vector must have one column');
    end

  [m2,n]=size(samples);

%  Check both arrays

  if (m1 ~= m2)
    error ('There must be the same number of rows for element_no vector and samples matrix');
    end

%  Call the C-part of the program to insert apodization

   Mat_field (1082, Th, element_no, samples);


