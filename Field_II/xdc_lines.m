%  Procedure for creating an aperture bounded by a set of lines
%
%  Calling:  Th = xdc_lines (lines, center, focus); 
%
%  Parameters:   
%
%    lines -  Information about the lines. One row
%             for each line. The contents is:
%
%       Index  Variable     Value
%      ------------------------------------------------------------------------------
%         1     no_phys    The number for the physical element starting from one
%         2     no_mat     The number for the mathematical element starting from one
%         3     slope      Slope of line (NaN is infinity slope)
%         4     infinity   True if slope is infinity
%         5     intersect  Intersection with y-axis (slope<>NaN)
%                          or x-axis if slope is infinity
%         6     above      Whether the active aperture is above or to
%                          the left (for infinite slope) of the line
%
%    center - The center of the physical elements. One line for
%             each physical element starting from 1.
%
%    focus  - The fixed focus for this aperture.
%
%  All dimensions are in meters.
%
%  Notice that this procedure will only work for flat element positioned
%  in the x-y plane.
%
%  Return:    A handle Th as a pointer to this transducer aperture.
%
%  Version 1.0, August 1, 1997 by Joergen Arendt Jensen

function Th = xdc_lines (lines, center, focus)

%  Check that all parameters are valid

  [n,m] = size(lines);
  if (m~=6)
    error ('Field error: Not sufficient coordinates for lines')
    end

  [n,m] = size(center);
  if (m~=3)
    error ('Field error: Not correct size for center points')
    end

  [n,m] = size(focus);
  if (n~=1) | (m~=3)
    error ('Field error: Not correct size for focus point')
    end

%  Call the C-part of the program to create aperture

  Th = Mat_field (1022, lines, center, focus);


