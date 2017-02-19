%  Procedure for freeing the storage occupied by an aperture
%
%  Calling:  xdc_free(Th); 
%
%  Parameters:  Th   - Pointer to the transducer aperture.    
%
%  Return:    None
%
%  Version 1.0, November 28, 1995 by Joergen Arendt Jensen

function res = xdc_free (Th)


%  Call the C-part of the program to show aperture

  Mat_field (1040,Th);


