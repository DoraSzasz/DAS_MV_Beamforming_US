%  Procedure for calculating the received signal from a collection
%  of scatterers, when transmitting with each individual element 
%  and receiving with each of the elements in the receiving aperture.
%
%  Calling:  [scat, start_time] = calc_scat_all (Th1, Th2, points, amplitudes, dec_factor);
%
%  Parameters:  Th1        - Pointer to the transmitting aperture.
%               Th2        - Pointer to the receiving aperture.
%               points     - Scatterers. Vector with three columns (x,y,z)
%                            and one row for each scatterer. 
%               amplitudes - Scattering amplitudes. Row vector with one 
%                            entry for each scatterer.
%               dec_factor - Decimation factor for the output sampling rate.
%                            The sampling frequency is then fs/dec_factor,
%                            where fs is the sampling frequency set in the program.
%                            The factor must be an integer.
%
%  Return:      scat       - Received voltage traces. One signal for
%                            each physical element in the receiving
%                            aperture for each element in the
%                            transmitting aperture. The matrix is organized with
%                            one received signal for each receiving element and this
%                            is repeated for all transmitting element, so the first
%                            signal is transmitting with element one and receiving with
%                            element one. The transmitting with element one receiving with
%                            element two and so forth. The it is repeated with transmitting
%                            element 2, etc.
%               start_time - The time for the first sample in scat.
%
%  Version 1.2, August 17, 2001 by Joergen Arendt Jensen

function [scat, start_time] = calc_scat_all (Th1, Th2, points, amplitudes, dec_factor)

%  Check the point array

  [m1,n]=size(points);
  if (n ~= 3)
    error ('Points array must have three columns');
    end
  [m2,n]=size(amplitudes);
  if (m1 ~= m2)
    error ('There must be the same number of rows for points and amplitudes arrays');
    end
  dec_factor=round(dec_factor);
  if (dec_factor<1)
    error ('Illegal decimation factor. Must be one or larger.');
    end

%  Call the C-part of the program to make the calculation

  [scat, start_time] = Mat_field (4007, Th1, Th2, points, amplitudes, dec_factor);


