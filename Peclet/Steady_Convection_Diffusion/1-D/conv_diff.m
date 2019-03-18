%Mesh and Geometry:

%-----------------------%
%Length of the domain:
L=10;

%No of cells:
Ncells=5000;

%Size of each cell:
dx=L/Ncells;
%-----------------------%
 
%Physical properties:

U=-1; rho=1; Gamma=1;

Pe=(rho*U*L/Gamma)
%-----------------------%

%BCs
%-----------------------%
phi0=5;    %Dirchlet at left cell
phi1=10;     %Dirchlet at right cell
 
%Build matrix:
Diffusion

Convection_upwind

%-----------------------%

%Convection Diffusion eqn:

A=Aconv-Adiff;

b=bconv-bdiff;

%-----------------------%

%Solve:

phi=A\b;


%Plot:

plot(dx/2:dx:L-dx/2,phi); 
title('Convection diffusion')
xlabel('X cellcentre')
ylabel('phi')
%-----------------------% 



