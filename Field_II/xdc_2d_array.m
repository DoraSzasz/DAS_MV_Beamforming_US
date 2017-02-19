%  Procedure for creating a 2d (sparse) array transducer
%
%  Calling:  Th = xdc_2d_array (no_ele_x, no_ele_y, width, height, kerf_x, kerf_y, 
%                               enabled, no_sub_x, no_sub_y, focus); 
%
%  Parameters:   no_ele_x    -  Number of physical elements in x-direction.
%                no_ele_y    -  Number of physical elements in y-direction.
%                width       -  Width in x-direction of elements.
%                height      -  Width in y-direction of elements.
%                kerf_x      -  Width in x-direction between elements.
%                kerf_y      -  Width in y-direction between elements.
%                enabled     -  Matrix of size (no_ele_x, no_ele_y) indicating 
%                               whether the physical element is used. A 1 indicates 
%                               an enabled element and zero that it is not.
%                               enable(1,1) determines the state of the 
%                               lower left element of the transducer.
%                no_sub_x    -  Number of sub-divisions in x-direction of elements.
%                no_sub_y    -  Number of sub-divisions in y-direction of elements.
%                focus[]     -  Fixed focus for array (x,y,z). Vector with three elements.         
%
%  Return:    A handle Th as a pointer to this transducer aperture.
%
%  Version 1.0, December 5, 1995 by Joergen Arendt Jensen

function Th = xdc_2d_array (no_ele_x, no_ele_y, width, height, kerf_x, kerf_y, enabled, no_sub_x, no_sub_y, focus)

%  Check that all parameters are valid

  if (no_ele_x<1) | (no_ele_y<1)
    error ('Field error: Illegal number of physical transducer elements')
    end

  if (width<=0) | (height<=0)
    error ('Field error: Width or height is negativ or zero')
    end

  if (kerf_x<0) | (kerf_y<0)
    error ('Field error: Kerf is negativ')
    end

  [n,m]=size(enabled);
  if (n ~= no_ele_x) | (m ~= no_ele_y)
    error ('Field error: The enabled array does not have the correct dimension')
    end

  if (no_sub_x<1) | (no_sub_y<1)
    error ('Field error: Number of mathematical elements must 1 or more')
    end

  if (min(size(focus))~=1) | (max(size(focus))~=3)
    error ('Field error: Focus must be a vector with three elements')
    end

%  Call the C-part of the program to create aperture

  Th = Mat_field (1002,no_ele_x, no_ele_y, width, height, kerf_x, kerf_y, enabled, no_sub_x, no_sub_y, focus);


