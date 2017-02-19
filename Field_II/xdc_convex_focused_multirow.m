%  Procedure for creating a convex, elevation focused array transducer
%  with an number of rows (1.5D array)
%
%  Calling:  Th = xdc_convex_focused_multirow (no_elem_x, width, no_ele_y, heights, kerf_x, kerf_y, 
%                                              Rconvex, Rfocus, no_sub_x, no_sub_y, focus); 
%
%  Parameters:   no_elem_x   -  Number of physical elements in x-direction.
%                width       -  Width in x-direction of elements.
%                no_elem_y   -  Number of physical elements in y-direction.
%                heights[]   -  Heights of the element rows in the y-direction. 
%                               Vector with no_elem_y values.
%                kerf_x      -  Width in x-direction between elements.
%                kerf_y      -  Gap in y-direction between elements.
%                Rconvex     -  Convex radius.
%                Rfocus      -  Radius of mechanical elevation focus.
%                no_sub_x    -  Number of sub-divisions in x-direction of physical elements.
%                no_sub_y    -  Number of sub-divisions in y-direction of physical elements.
%                focus[]     -  Fixed focus for array (x,y,z). Vector with three elements.         
%
%  Return:    A handle Th as a pointer to this transducer aperture.
%
%  Version 1.0, June 26, 1998 by Joergen Arendt Jensen

function Th = xdc_focused_multirow (no_elem_x, width, no_elem_y, heights, kerf_x, kerf_y, Rconvex, Rfocus, no_sub_x, no_sub_y, focus)

%  Check that all parameters are valid

  if (no_elem_x<1)
    error ('Field error: Illegal number of physical transducer elements in x-direction')
    end

  if (width<=0)
    error ('Field error: Width of elements is negativ or zero')
    end

  if (no_elem_y<1)
    error ('Field error: Illegal number of physical transducer elements in y-direction')
    end

  if (min(heights)<=0)
    error ('Field error: Height of elements is negativ or zero')
    end

  if (length(heights)~=no_elem_y)
    error ('Field error: Number of heights does not equal no_elem_y')
    end

  if ((sum(heights)+(no_elem_y-1)*kerf_y)>2*Rfocus)
    error ('Field error: Total height of elements is to large')
    end

  if (kerf_x<0)
    error ('Field error: Kerf in x-direction is negativ')
    end

  if (kerf_y<0)
    error ('Field error: Kerf in y-direction is negativ')
    end

  if (Rconvex<0)
    error ('Field error: Convex radius is negative')
    end

  if (pi*Rconvex<=(kerf_x*(no_elem_x-1)+width*no_elem_x))
    error ('Field error: Width of elements is to large compared to Rconvex')
    end
    
  if (Rfocus<=0)
    error ('Field error: Radius of elevation focus is negativ or zero')
    end

  if (no_sub_x<1) | (no_sub_y<1)
    error ('Field error: Number of mathematical elements must be 1 or more')
    end

  if (min(size(focus))~=1) | (max(size(focus))~=3)
    error ('Field error: Focus must be a vector with three elements')
    end

%  Call the C-part of the program to create aperture

  Th = Mat_field (1014,no_elem_x, width, no_elem_y, heights, kerf_x, kerf_y, Rconvex, Rfocus, no_sub_x, no_sub_y, focus);


