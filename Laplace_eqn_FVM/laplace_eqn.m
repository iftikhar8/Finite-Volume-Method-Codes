%Solve Laplace eqn in a structured grid using FVM% 
clear all
close all
clc


%----------------Domain Definition-------------------%
Domain_definition


%---------------Boundary Conditions-------------------%
Specify_Boundary_conditions

 
%----------------Build Matrix---------------------%
Build_matrix

%----------------Solve---------------------------%
tic
xsol=A\b;
toc

%----------------Plot---------------------------%

for i=1:Ny
    for j=1:Nx
        phi(i,j)=xsol(element_number(i,j),1);  %Assign phi values to the grid points
    end
end
 
surf(X(2:end,2:end)-delx/2,Y(2:end,2:end)-dely/2,phi);   %phi values are plotted at the cell centres



colorbar 
grid off
view(0,-90)
axis equal 
 
 



