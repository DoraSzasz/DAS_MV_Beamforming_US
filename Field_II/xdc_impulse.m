%  Procedure for setting the impulse response of an aperture
%
%  Calling:  xdc_impulse (Th,pulse); 
%
%  Parameters:  Th - Pointer to the transducer aperture.    
%               pulse - Impulse response of aperture as row vector
%
%  Return:    None
%
%  Version 1.01, May 20, 1997 by Joergen Arendt Jensen

function res = xdc_impulse (Th, pulse)

%  Test that pulse is of right dimension

  [n,m]=size(pulse);
  if (n ~= 1)
    error ('Pulse must be a row vector');
    end

%  Call the C-part of the program to show aperture

  Mat_field (1050,Th,pulse);


