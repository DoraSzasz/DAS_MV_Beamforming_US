%  Procedure for setting the minimum quantization interval that
%  can be used when phasing the transducer.
%
%  Remember that the focus time lines must be set again for the
%  quantization to take effect. This setting does not affect the
%  user calculated delays.
%
%  Calling:  xdc_quantization (Th, min_delay); 
%
%  Parameters:  Th   - Pointer to the transducer aperture.    
%               min_delay - The smallest delay in seconds that can be
%                           used by the system. No quantization is used, 
%                           if this delay is set to zero.
%
%  Return:    None.
%
%  Version 1.01, July 10, 1998 by Joergen Arendt Jensen

function res = xdc_quantization (Th, min_delay)

%  Call the C-part of the program to set quantization

  Mat_field (1065,Th,min_delay);


