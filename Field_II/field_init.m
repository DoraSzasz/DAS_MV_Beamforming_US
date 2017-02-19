%  Procedure for initializing the Field II program system. Must be 
%  the first routine that is called before using the system.
%
%  Calling:  field_init (suppress);
%
%  Return:   nothing.
%
%  Input:  suppress: An optional argument suppress with a value 
%                    of zero can be given to suppress the
%                    display of the initial field screen.
%                    No ACII ouput will be given, if the argument
%                    is -1. Debug messages will be written if
%		     enable by field_debug, and all error messages
%		     will also be printed.
%
%  Version 1.2, January 20, 1999 by Joergen Arendt Jensen

function res = field_init (suppress)

%  Call the C-part of the program to initialize it

  if (nargin==1)
    Mat_field (5001,suppress);
  else
    Mat_field (5001,1);
    end


