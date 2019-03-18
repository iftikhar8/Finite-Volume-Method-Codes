%Domain:

Lx=100;
Ly=50;

%Mesh:
global Nx Ny
Nx=100;
Ny=50;
Ncells=Nx*Ny;

%Cell size:
hx=Lx/Nx;
hy=Ly/Ny;

%Cell centres:
[x,y]=meshgrid(hx/2:hx:Lx-hx/2,hy/2:hy:Ly-hy/2);

 
