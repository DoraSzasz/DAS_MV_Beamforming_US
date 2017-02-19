%  Set the sampling frequency the system uses.
%
%  Remember that the pulses used in all apertures must
%  be reset for the new sampling frequency to take effect.
%
%  Calling:  set_sampling (fs);
%
%  Parameters:  fs - The new sampling frequency.
%
%  Return:   nothing.
%
%  Version 1.0, December 7, 1995 by Joergen Arendt Jensen

function res = set_sampling(fs)

%  Call the C-part of the program to initialize it

  Mat_field (5020,fs);


