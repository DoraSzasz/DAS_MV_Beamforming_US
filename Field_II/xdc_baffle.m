%  Procedure for setting the baffle condition for the aperture.
%
%  Calling:  xdc_baffle (Th, soft_baffle); 
%
%  Parameters:  Th          - Pointer to the transducer aperture.    
%               soft_baffle - Whether to use the soft-baffle condition:
%                                1 - using soft baffle
%                                0 - using rigid baffle (default for apertures)
%
%  Return:    None.
%
%  Version 1.0, July 10, 1998 by Joergen Arendt Jensen

function res = xdc_baffle (Th, soft_baffle)

%  Call the C-part of the program to set baffle condition

  Mat_field (1066, Th, soft_baffle);

