%  Procedure for creating a concave transducer
%
%  Calling:  Th = xdc_concave (radius, focal_radius, ele_size); 
%
%  Parameters:   radius       - Radius of aperture.
%                focal_radius - Focal radius of aperture.
%                ele_size     - Size of elements for modeling transducer.
%
%  All dimensions are in meters.
%
%  Return:    A handle Th as a pointer to this transducer aperture.
%
%  Version 1.0, August 21, 1996 by Joergen Arendt Jensen

function Th = xdc_concave (radius, focal_radius, ele_size)

%  Check that all parameters are valid

  if (radius<0)
    error ('Field error: Negative radius of physical transducer elements')
    end

  if (focal_radius<=0)
    error ('Field error: Negativ focal radius')
    end

  if (ele_size<=0) | (ele_size>radius)
    error ('Field error: Illegal size of mathematical element')
    end

%  Call the C-part of the program to create aperture

  Th = Mat_field (1011, radius, focal_radius, ele_size);


