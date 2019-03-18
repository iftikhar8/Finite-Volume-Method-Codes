%phi:

%grid
phi_cell=zeros(Ny,Nx);
dd=4;
phi_cell(Ny/2-dd:Ny/2+dd,Nx/2-dd:Nx/2+dd)=100*ones(2*dd+1,2*dd+1); %nonuniform

%column 
for i=1:Ny
    for j=1:Nx
        phi(cell_number(i,j),1)=phi_cell(i,j);  
    end
end 

%TODO use reshape instead
