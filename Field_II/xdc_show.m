%  Procedure for showing an aperture
%
%  Calling:  xdc_show(Th, info_type); 
%
%  Parameters:  Th   - Pointer to the transducer aperture.    
%               info_type - Which information to show (text string). 
%                      The possibilities are:
%                          elements - information about elements
%                          focus    - focus time line
%                          apo      - apodization time line
%                          all      - all information is shown
%                      The argument is optional, and by default all
%                      information is shown.
%
%  Return:    ASCII output on the screen about the aperture
%
%  Version 1.0, November 28, 1995 by Joergen Arendt Jensen

function res = xdc_show (Th, info_type)

%  Check the type argument

  if nargin < 2
    info_type = 'all';
    end

  if strcmp(info_type, 'elements')
    info =1;
  elseif strcmp(info_type, 'focus')
    info = 2;
  elseif strcmp(info_type, 'apo')
    info = 3;
  else
    info = 0;
  end

%  Call the C-part of the program to show aperture

  Mat_field (1100,Th,info);


