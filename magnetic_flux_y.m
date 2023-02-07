function B = magnetic_flux_y(x, y, z, I, a, N) 
% Calculate the magnetic field vector created at (x, y, z) by the coil with radius a, number of turns N, and current I at the origin
%   Detailed explanation goes here
myu = 1.2566*10^(-6); %
pi = 3.1415926536; 


%a = 0.015;
%I = 1;
split = 100;
d_phi = 2*pi/split;

%{
x = 0;
y = 0;
z = 0;
%}


phi = 0;


B = [0, 0, 0];
i = 0;
%disp(d_B)
%disp(x)

while i < split
    i = i + 1;
    phi = phi + d_phi;
    d_B = ((myu*N*I*a)/(4*pi))*((x-a*sin(phi))^2+y^2+(z-a*cos(phi))^2)^(-3/2)*[y*sin(phi), -x*sin(phi)-z*cos(phi)+a, y*cos(phi)]*d_phi;
    %disp(d_B)
    B = B + d_B;
end


end