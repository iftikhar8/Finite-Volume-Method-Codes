%Solve Diffusion eqn in a structured grid using FVM% 

%(d(T)/dt-k*laplacian(T))=0
clear all
close all
clc


%----------------Domain Definition---------------%
Domain_definition

%--------------------Time------------------------%
Time

%---------------Physical parameter---------------%
Physicalparameter

%---------------Boundary Conditions--------------%
Specify_Boundary_conditions

%---------------Initial Conditions---------------%
Initialcondition


 
%---------------Discretize Operators-------------%
laplacian

ddt

 
%-------------------Matrix Eqs-------------------%

A=Addt-Alaplacian;
b=-blaplacian;                       


%Time Loop:

%Video record:
 
v = VideoWriter('diffusion.avi');   %Change video file name if you want.
FrameRate=10; 
open(v);

for t=1:Nt

xsol_old=(1/dt)*xsol; 
b=b+xsol_old;

%----------------------Solve--------------------%
tic
xsol=A\b;
toc

b=b-xsol_old;

%----------------Plot----------------------------%
 
 
for i=1:Ny
    for j=1:Nx
        phi(i,j)=xsol(element_number(i,j),1);  %Assign phi values to the grid points
    end
end
  
plott   %Plot 


frame = getframe(gcf);   %record frames
writeVideo(v,frame);
end 
 
close(v); %close video file     

