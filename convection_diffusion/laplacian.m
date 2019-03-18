%Build matrix
%Initialize Alaplacian matrix:

Alaplacian=zeros(Ncells,Ncells);

%Initialize b matrix:
blaplacian=zeros(Ncells,1);


%Build matrix for interior cells:


%TODO non-uniform diffusion coefficient

%for loop runs over the grid
for i=1:Ny
    for j=1:Nx
         a_e=0;a_w=0;a_n=0;a_s=0;a_p=0;rhs=0;
         
%Compute a_n and its effects          
        if (i==1)
            %cell is sharing north boundary
            if strcmp(str_top,'Gradient')
                %check the top boundary has gradient boundary condition
                a_n=0; rhs=rhs-(gradient_top)*hx; a_p=a_p+0;
            else
                %top boundary has fixed boundary condition
                a_n=0; rhs=rhs-(phi_top)*2*hx/hy; a_p=a_p-2*hx/hy;
            end
        else
            %cell is not sharing the top boundary
            a_n=a_n+hx/hy; rhs=rhs+0; a_p=a_p-(hx/hy);
        end
        
        
%Compute a_s and its effects             
        if (i==Ny)
            %cell is sharing bottom boundary
            if strcmp(str_bottom,'Gradient')
                %check the bottom boundary has gradient boundary condition
                a_s=0; rhs=rhs-(gradient_bottom)*hx; a_p=a_p+0;
            else
                %bottom boundary has fixed boundary condition
                a_s=0; rhs=rhs-(phi_bottom)*2*hx/hy; a_p=a_p-2*hx/hy;
            end
        else
            %cell is not sharing the bottom boundary
            a_s=a_s+hx/hy; rhs=rhs+0; a_p=a_p-(hx/hy);
        end
        
        
        
 %Compute a_w and its effects             
        if (j==1)
            %cell is sharing left boundary
            if strcmp(str_left,'Gradient')
                %check the left boundary has gradient boundary condition
                a_w=0; rhs=rhs-(gradient_left)*hy; a_p=a_p+0;
            else
                %left boundary has fixed boundary condition
                a_w=0; rhs=rhs-(phi_left)*2*hy/hx; a_p=a_p-2*hy/hx;
            end
        else
            %cell is not sharing the left boundary
            a_w=a_w+hy/hx; rhs=rhs+0; a_p=a_p-(hy/hx);
        end
              
        
%Compute a_e and its effects             
        if (j==Ny)
            %cell is sharing right boundary
            if strcmp(str_right,'Gradient')
                %check the right boundary has gradient boundary condition
                a_e=0; rhs=rhs-(gradient_right)*hy; a_p=a_p+0;
            else
                %right boundary has fixed boundary condition
                a_e=0; rhs=rhs-(phi_right)*2*hy/hx; a_p=a_p-2*hy/hx;
            end
        else
            %cell is not sharing the right boundary
            a_e=a_e+hy/hx; rhs=rhs+0; a_p=a_p-(hy/hx);
        end
         
        
        
         
        
        
        %Update coefficients in the Alaplacian matrix:
         
        
        %Access different cell numbers and fill the matrix:
        centre=cell_number(i,j);  Alaplacian(centre,centre)=a_p;
        if i>1
        north=cell_number(i-1,j); Alaplacian(centre,north)=a_n;
        end
        
        if i<Ny
        south=cell_number(i+1,j);  Alaplacian(centre,south)=a_s;
        end
        
        if j<Nx
        east=cell_number(i,j+1);   Alaplacian(centre,east)=a_e;
        end
        
        if j>1
        west=cell_number(i,j-1);   Alaplacian(centre,west)=a_w; 
        end
       
        blaplacian(centre,1)=rhs; 
    end
end
