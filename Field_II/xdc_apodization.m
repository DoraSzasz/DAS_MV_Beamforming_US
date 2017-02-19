%  Procedure for creating an apodization time line for an aperture
%
%  Calling:  xdc_apodization (Th, times, values); 
%
%  Parameters:  Th     - Pointer to the transducer aperture.  
%               times  - Time after which the associated apodization is valid. 
%               values - Apodization values. Matrix with one row for each
%                        time value and a number of columns equal to the 
%                        number of physical elements in the aperture. At
%                        least one apodization value in each row must be different
%                        from zero.
%
%  Return:      none.
%
%  Version 1.01, June 19, 1998 by Joergen Arendt Jensen
%  Version 1.1, May 6, 2011 by JAJ - Check of zero apodization added


function res = xdc_apodization (Th,times,values)

%  Check the times vector

  [m1,n]=size(times);
  if (n ~= 1) 
    error ('Times vector must have one column');
    end

  [m2,n]=size(values);

%  Check both arrays

  if (m1 ~= m2)
    error ('There must be the same number of rows for times and values');
    end

%  Check that there is not one column with only zeros

  for i=1:m1
    if (sum(abs(values(i,:)))==0)
      error('There must be at least one apodization value different from zero in a column')
      end
    end
    
%  Call the C-part of the program to insert apodization

   Mat_field (1070,Th,times,values);


