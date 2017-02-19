%  Set options for the program.
%
%  Calling:  set_field (option_name, value);
%
%  Possible options          Value
%
%   use_att               Whether to use attenuation (<> 0 for attenuation)
%   att                   Frequency independent attenuation in dB/m.
%   freq_att              Frequency dependent attenuation in dB/[m Hz]
%                         around the center frequency att_f0.
%   att_f0                Attenuation center frequency in Hz.
%   tau_m                 The variable tau_m in the attenuation calculation.
%
%   debug                 Whether to print debug information (1 = yes)
%   show_times            Whether to print information about the time 
%                         taken for the calculation (yes = any positive numer).
%                         A number large than 2 is taken as the time in seconds
%                         between the printing of estimates.
%   use_rectangles        Whether to use rectangles (1) for the apertures
%   use_triangles         Whether to use triangles (1) for the apertures or rectangles (0)
%   use_lines             Whether to use lines (1) for the apertures or rectangles (0)
%
%   accurate_time_calc    Whether to use accurate time calculation for rectangular elements (1)
%                         or an approximative calculation
%   fast_integration      Whether to use fast integration (1) of the responses for bound lines
%                         and triangles
%
%   c                     Set the speed of sound in m/s.
%   fs                    Set the sampling frequency.
%
%  Variables used for non-linear imaging:
%
%   z                     Characteristic acoustic impedance of the medium in kg/[m^2 s]
%   dz                    Step for propagating the pulse in m
%   BdivA                 The B/A parameter
%                   
%  Return:   nothing.
%
%  Example:  Set the attenuation to 1.5 dB/cm, 0.5 dB/[MHz cm] around
%            3 MHz and use this:
%
%     set_field ('att',1.5*100);
%     set_field ('Freq_att',0.5*100/1e6);
%     set_field ('att_f0',3e6);
%     set_field ('use_att',1);
%
%  Note that the frequency independent and frequency dependent attenuation
%  should normally agree, so that  Freq_att*att_f0 =  att.
%
%  Version 1.8, August 1, 2002 by Joergen Arendt Jensen

function res = set_field (option_name, value)

%  Check the option name

  if (~isstr(option_name))
    error ('First argument must be an option name');
    end

%  Call the C-part of the program to set the option

  Mat_field (5050, option_name, value);


