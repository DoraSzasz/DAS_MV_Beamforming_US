%  Procedure for creating an aperture consisting of rectangles
%
%  Calling:  Th = xdc_rectangles (rect, center, focus); 
%
%  Parameters:   
%
%    rect  -  Information about the rectangles. One row
%             for each rectangle. The contents is:
%
%       Index  Variable     Value
%      -----------------------------------------------------------------------
%         1       no     The number for the physical aperture starting from one
%        2-4   x1,y1,z1  First corner coordinate
%        5-7   x2,y2,z2  Second corner coordinate
%        8-10  x3,y3,z3  Third corner coordinate
%       11-13  x4,y4,z4  Fourth corner coordinate
%        14       apo    Apodization value for this element. 
%        15      width   Width of the element  (x direction)
%        16      heigth  Height of the element (y direction)
%       17-19  c1,c2,c2  Center point of the rectangle
%
%              The corner coordiantes points must
%              be in a sorted order, so that they are meet in
%              counter clockwise order when going from 1 to 2 to 3 to 4.  
%              The rectangle number given must also be in increasing order.
%
%    center - The center of the physical elements. One line for
%             each element starting from 1.
%
%    focus  - The fixed focus for this aperture.
%
%  All dimensions are in meters.
%
%  Return:    A handle Th as a pointer to this transducer aperture.
%
%  Version 1.0, August 1, 1997 by Joergen Arendt Jensen

function Th = xdc_rectangles (rect, center, focus)

%  Check that all parameters are valid

  [n,m] = size(rect);
  if (m~=19)
    error ('Field error: Not sufficient coordinates for rectangles')
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

  Th = Mat_field (1021, rect, center, focus);


