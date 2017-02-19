%  Procedure for displaying the Field II users' guide
%  using the acrobat reader
%
%  Calling:  field_guide
%
%  Parameters:  None
%
%  Return:      The Field II guide is displayed in a separate
%               window using acrobat reader. This demands that
%               acrobat reader is installed and that the
%               users guide is available under Matlab as users_guide.pdf
%
%  Version 1.01, May 6, 2011 by Joergen Arendt Jensen

%  Call acrobat reader

guide=which('users_guide.pdf');
if  isempty(guide)
  disp('The Field II users guide is not accessible under Matlab')
  disp('It should be placed in the same directory as the m-files for Field II')
  disp('and it should be called users_guide.pdf. The guide can be obtained')
  disp('from http://server.elektro.dtu.dk/personal/jaj/field/?users_guide.html')
else
  cmd=['!acroread ',guide,' &'];
  eval(cmd)
  end


