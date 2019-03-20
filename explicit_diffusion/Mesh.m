%Domain:

Lx=1;
Ly=1;

%Mesh:
global Nx Ny hx hy
Nx=100;
Ny=100;
Ncells=Nx*Ny;

%Cell size:
hx=Lx/Nx;
hy=Ly/Ny;

%Cell centres:
[x,y]=meshgrid(hx/2:hx:Lx-hx/2,hy/2:hy:Ly-hy/2);

 
