%  Function to display the logo for field
%
%  Version 1.3, August 10, 2007 by Joergen Arendt Jensen
%    Error in loading filr fixed

function res = field_logo 

%  Create a window and display the Field II logo

  h=figure;
  axes('position',[0 0 1 1]);
  place=which ('logo_field.mat');
  eval(['load ',place])
  image(data1);
  axis off
  colormap(map);
  drawnow;
  pause(5)
  close(h);


