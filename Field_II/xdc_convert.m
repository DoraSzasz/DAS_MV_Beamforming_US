%  Procedure for converting an aperture from consisting of rectangles
%  to consist of triangles
%
%  Calling:  xdc_convert (Th); 
%
%  Parameters:   A handle Th as a pointer to this transducer aperture. The
%                pointer value will be the same as for the rectangular aperture.
%                The rectangles defined in the aperture will be released. 
%
%  Version 1.0, October 15, 1996 by Joergen Arendt Jensen

function res = xdc_convert (Th)

%  Call the C-part of the program to convert aperture

  Mat_field (1030, Th);


