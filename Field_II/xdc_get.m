%  Procedure for getting data for an aperture
%
%  Calling:  data = xdc_get(Th, info_type); 
%
%  Parameters:  Th   - Pointer to the transducer aperture.    
%               info_type - Which information to get (text string). 
%                      The possibilities are:
%                          rect     - information about rectangular elements
%                          tri      - information about triangular elements
%                          lin      - information about line bounded elements
%                          focus    - focus time line
%                          apo      - apodization time line
%
%  Return:    data - data about the aperture
%
%  Example:  data = xdc_get (Th,'focus');
%
%     Returns the delay values for this aperture. See the manual for the
%     individual values content in the user's guide.
%
%  Version 1.1, November 29, 2001 by Joergen Arendt Jensen

function data = xdc_get (Th, info_type)

%  Check the type argument

  if nargin < 2
    info_type = 'rect';
    end

  if strcmp(info_type, 'rect')
    info = 1;
  elseif strcmp(info_type, 'tri')
    info = 2;
  elseif strcmp(info_type, 'lin')
    info = 3;
  elseif strcmp(info_type, 'focus')
    info = 4;
  elseif strcmp(info_type, 'apo')
    info = 5;
  else
    info = 1;
  end

%  Call the C-part of the program to show aperture

  data = Mat_field (1101,Th,info);


