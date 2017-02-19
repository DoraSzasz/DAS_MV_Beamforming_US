%  Procedure for creating a linear array transducer
%
%  Calling:  Th = xdc_linear_array (no_elements, width, height, kerf, no_sub_x, no_sub_y, focus); 
%
%  Parameters:   no_elements -  Number of physical elements.
%                width       -  Width in x-direction of elements.
%                height      -  Width in y-direction of elements.
%                kerf        -  Width in x-direction between elements.
%                no_sub_x    -  Number of sub-divisions in x-direction of elements.
%                no_sub_y    -  Number of sub-divisions in y-direction of elements.
%                focus[]     -  Fixed focus for array (x,y,z). Vector with three elements.         
%
%  Return:    A handle Th as a pointer to this transducer aperture.
%
%  Version 1.0, November 20, 1995 by Joergen Arendt Jensen

function Th = xdc_linear_array (no_elements, width, height, kerf, no_sub_x, no_sub_y, focus)

%  Check that all parameters are valid

  if (no_elements<1)
    error ('Field error: Illegal number of physical transducer elements')
    end

  if (width<=0) | (height<=0)
    error ('Field error: Width or height is negativ or zero')
    end

  if (kerf<0)
    error ('Field error: Kerf is negativ')
    end

  if (no_sub_x<1) | (no_sub_y<1)
    error ('Field error: Number of mathematical elements must 1 or more')
    end

  if (min(size(focus))~=1) | (max(size(focus))~=3)
    error ('Field error: Focus must be a vector with three elements')
    end

%  Call the C-part of the program to create aperture

  Th = Mat_field (1001,no_elements, width, height, kerf, no_sub_x, no_sub_y, focus);


