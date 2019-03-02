%----------------Domain Definition-------------------%
%Dimension of the domain:
Lx= input('Give Length of the domain along x direction:');
Ly= input('Give Length of the domain along y direction:'); 

%No of cells along x and y:
global Nx Ny 
Nx= input('Give number of elements along x direction:'); 
Ny= input('Give number of elements along y direction:'); 

Nelem=Nx*Ny;

%size of each cell:
delx=Lx/Nx;
dely=Ly/Ny;




%Plot mesh:
x = 0 : delx : Lx;
y = 0 : dely : Ly;
[X, Y] = meshgrid(x, y);
h = mesh(X,Y,ones(size(X)));
set(h,'markeredgecolor','k')
grid off
view(0,-90)
axis equal 

 
 
 
 