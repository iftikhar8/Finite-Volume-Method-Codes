%phi:

%grid
phi_cell=zeros(Ny,Nx);
 
 

%column 
for i=1:Ny
    for j=1:Nx
        phi(cell_number(i,j),1)=phi_cell(i,j);  
    end
end 

%TODO use reshape instead
