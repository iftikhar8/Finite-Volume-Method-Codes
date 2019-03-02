%Build matrix
%Initialize Alaplacian matrix:

Alaplacian=zeros(Nelem,Nelem);

%Initialize b matrix:
blaplacian=zeros(Nelem,1);


%Build matrix for interior elements:




%for loop runs over the grid
for i=1:Ny
    for j=1:Nx
         a_e=0;a_w=0;a_n=0;a_s=0;a_p=0;rhs=0;
         
%Compute a_n and its effects          
        if (i==1)
            %element is sharing north boundary
            if strcmp(str_top,'Gradient')
                %check the top boundary has gradient boundary condition
                a_n=0; rhs=rhs-(gradient_top)*delx; a_p=a_p+0;
            else
                %top boundary has fixed boundary condition
                a_n=0; rhs=rhs-(phi_top)*2*delx/dely; a_p=a_p-2*delx/dely;
            end
        else
            %element is not sharing the top boundary
            a_n=a_n+delx/dely; rhs=rhs+0; a_p=a_p-(delx/dely);
        end
        
        
%Compute a_s and its effects             
        if (i==Ny)
            %element is sharing bottom boundary
            if strcmp(str_bottom,'Gradient')
                %check the bottom boundary has gradient boundary condition
                a_s=0; rhs=rhs-(gradient_bottom)*delx; a_p=a_p+0;
            else
                %bottom boundary has fixed boundary condition
                a_s=0; rhs=rhs-(phi_bottom)*2*delx/dely; a_p=a_p-2*delx/dely;
            end
        else
            %element is not sharing the bottom boundary
            a_s=a_s+delx/dely; rhs=rhs+0; a_p=a_p-(delx/dely);
        end
        
        
        
 %Compute a_w and its effects             
        if (j==1)
            %element is sharing left boundary
            if strcmp(str_left,'Gradient')
                %check the left boundary has gradient boundary condition
                a_w=0; rhs=rhs-(gradient_left)*dely; a_p=a_p+0;
            else
                %left boundary has fixed boundary condition
                a_w=0; rhs=rhs-(phi_left)*2*dely/delx; a_p=a_p-2*dely/delx;
            end
        else
            %element is not sharing the left boundary
            a_w=a_w+dely/delx; rhs=rhs+0; a_p=a_p-(dely/delx);
        end
              
        
%Compute a_e and its effects             
        if (j==Ny)
            %element is sharing right boundary
            if strcmp(str_right,'Gradient')
                %check the right boundary has gradient boundary condition
                a_e=0; rhs=rhs-(gradient_right)*dely; a_p=a_p+0;
            else
                %right boundary has fixed boundary condition
                a_e=0; rhs=rhs-(phi_right)*2*dely/delx; a_p=a_p-2*dely/delx;
            end
        else
            %element is not sharing the right boundary
            a_e=a_e+dely/delx; rhs=rhs+0; a_p=a_p-(dely/delx);
        end
         
        
        
         
        
        
        %Update coefficients in the Alaplacian matrix:
         
        
        %Access different element numbers and fill the matrix:
        centre=element_number(i,j);  Alaplacian(centre,centre)=a_p;
        if i>1
        north=element_number(i-1,j); Alaplacian(centre,north)=a_n;
        end
        
        if i<Ny
        south=element_number(i+1,j);  Alaplacian(centre,south)=a_s;
        end
        
        if j<Nx
        east=element_number(i,j+1);   Alaplacian(centre,east)=a_e;
        end
        
        if j>1
        west=element_number(i,j-1);   Alaplacian(centre,west)=a_w; 
        end
       
        blaplacian(centre,1)=rhs; 
    end
end
