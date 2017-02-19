%  Procedure for initialize the Field II debugging. This will print
%  out various information about the programs inner working.
%
%  Calling:  field_debug(state)
%
%  Parameters:  State - 1: debugging, 0: no debugging.
%
%  Return:   nothing.
%
%  Version 1.0, November 20, 1995 by Joergen Arendt Jensen

function res = field_debug (state)

%  Call the C-part of the program to debug it

  Mat_field (5010,state);


