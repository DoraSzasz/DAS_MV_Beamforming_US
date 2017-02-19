%  Procedure for creating an aperture with a number
%  of physical elements consisting of triangles
%
%  Calling:  Th = xdc_triangles (data, center, focus); 
%
%    data  -  Information about the triangles. One row
%             for each triangle. The contents is:
%
%       Index  Variable     Value
%      -----------------------------------------------------------------------
%         1       no     The number for the physical aperture starting from one
%        2-4   x1,y1,z1  First corner coordinate
%        5-7   x2,y2,z2  Second corner coordinate
%        8-10  x3,y3,z3  Third corner coordinate
%        11       apo    Apodization value for this element. 
%
%              The physical triangle number given must be in increasing order.
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
%  Version 1.0, January 20, 1999 by Joergen Arendt Jensen

function Th = xdc_triangles (data, center, focus)

%  Check that all parameters are valid

  [n,m] = size(data);
  if (m~=11)
    error ('Field error: Not sufficient coordinates for triangles')
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

  Th = Mat_field (1023, data, center, focus);


