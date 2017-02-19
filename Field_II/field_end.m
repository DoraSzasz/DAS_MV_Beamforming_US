%  Procedure for ending the Field II program system and releasing the storage.
%
%  Calling:  field_end ;
%
%  Return:   nothing.
%
%  Version 1.0, November 28, 1995 by Joergen Arendt Jensen

function res = field_end ()

%  Call the C-part of the program to initialize it

  Mat_field (5002);


