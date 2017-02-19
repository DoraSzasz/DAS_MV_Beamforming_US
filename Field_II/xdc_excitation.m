%  Procedure for setting the excitation pulse of an aperture
%
%  Calling:  xdc_excitation (Th,pulse); 
%
%  Parameters:  Th    - Pointer to the transducer aperture.    
%               pulse - Excitation pulse of aperture as row vector
%
%  Return:    None
%
%  Version 1.0, November 27, 1995 by Joergen Arendt Jensen

function res = xdc_excitation (Th, pulse)

%  Test that pulse is of right dimension

  [n,m]=size(pulse);
  if (n ~= 1)
    error ('Pulse must be a row vector');
    end

%  Call the C-part of the program to show aperture

  Mat_field (1051,Th,pulse);


