%Convection:


%velocity:
u=zeros(Ny,Nx,2); 
u(:,:,1)=10*ones(Ny,Nx);
u(:,:,2)=10*ones(Ny,Nx);
 
 
%quiver(x,y,u(:,:,1),u(:,:,2));
 

 

%velocity*rho:
urho=zeros(Ny,Nx,2);
urho(:,:,1)=u(:,:,1).*rho;
urho(:,:,2)=u(:,:,2).*rho;


%mass flux:

%Linear interp of velocity from cell-center to face:
uf=zeros(Ny,Nx+1,1);
uf(:,2:end-1,1)=0.5*(urho(:,1:end-1,1)+urho(:,2:end,1));
uf(:,1,1)=urho(:,1,1);
uf(:,end,1)=urho(:,end,1);

vf=zeros(Ny+1,Nx);
vf(2:end-1,:,1)=0.5*(urho(1:end-1,:,2)+urho(2:end,:,2));
vf(1,:,1)=urho(1,:,2);
vf(end,:,1)=urho(end,:,2);

Aconv=zeros(Ncells,Ncells);
bconv=zeros(Ncells,1);


 
for i=1:Ny
    for j=1:Nx
         a_e=0;a_w=0;a_n=0;a_s=0;a_p=0;rhs=0;
         
         %mass flux at different faces:
         m_w=-uf(i,j)*hy;
         m_e=uf(i,j+1)*hy;
         m_n=vf(i,j)*hx;
         m_s=-vf(i+1,j)*hx;
         
         
         
         
%Compute a_n and its effects          
        if (i==1)
            %cell is sharing north boundary
            if strcmp(str_top,'Gradient')
                %check the top boundary has gradient boundary condition
                a_n=0;a_p=a_p+m_n;
                if m_n<0
                   msg = 'Error occurred-wrong boundary condition for convection at north';
		   error(msg)	
                end
            else
                %top boundary has fixed boundary condition
                if m_n<0
                rhs=rhs-(phi_top)*m_n;
                end
                if m_n>0
                a_p=a_p+m_n;
                end
            end
        else
            %cell is not sharing the top boundary
                if m_n<0
                a_n=m_n;
                end
                if m_n>0
                a_p=a_p+m_n;
                end
        end
        
        
%Compute a_s and its effects             
        if (i==Ny)
            %cell is sharing bottom boundary
            if strcmp(str_bottom,'Gradient')
                %check the bottom boundary has gradient boundary condition
                a_s=0;a_p=a_p+m_s;
                if m_s<0
                   msg = 'Error occurred-wrong boundary condition for convection at bottom';
		   error(msg)	
                end
                 
            else
                %bottom boundary has fixed boundary condition
                if m_s<0
                rhs=rhs-(phi_bottom)*m_s;
                end
                if m_s>0
                a_p=a_p+m_s;
                end 
            end
        else
            %cell is not sharing the bottom boundary
                if m_s<0
                a_s=m_s;
                end
                if m_s>0
                a_p=a_p+m_s;
                end 
        end
        
        
        
 %Compute a_w and its effects             
        if (j==1)
            %cell is sharing left boundary
            if strcmp(str_left,'Gradient')
                %check the left boundary has gradient boundary condition
                a_w=0;a_p=a_p+m_w;
                if m_w<0
                   msg = 'Error occurred-wrong boundary condition for convection at west';
		   error(msg)	
                end 
            else
                %left boundary has fixed boundary condition
                if m_w<0
                rhs=rhs-(phi_left)*m_w;
                end
                if m_w>0
                a_p=a_p+m_w;
                end  
            end
        else
            %cell is not sharing the left boundary
                if m_w<0
                a_w=m_w;
                end
                if m_w>0
                a_p=a_p+m_w;
                end 
        end
              
        
%Compute a_e and its effects             
        if (j==Ny)
            %cell is sharing right boundary
            if strcmp(str_right,'Gradient')
                %check the right boundary has gradient boundary condition
                a_e=0;a_p=a_p+m_e;
                if m_e<0
                   msg = 'Error occurred-wrong boundary condition for convection at east';
		   error(msg)	
                end 
            else
                %right boundary has fixed boundary condition
                if m_e<0
                rhs=rhs-(phi_right)*m_e;
                end
                if m_e>0
                a_p=a_p+m_e;
                end  
            end
        else
            %cell is not sharing the right boundary
                if m_e<0
                a_e=m_e;
                end
                if m_e>0
                a_p=a_p+m_e;
                end 
        end
         
        
        
         
         
        
        %Update coefficients in the Aconv matrix:
         
        
        %Access different cell numbers and fill the matrix:
        centre=cell_number(i,j);  Aconv(centre,centre)=a_p;
        if i>1
        north=cell_number(i-1,j); Aconv(centre,north)=a_n;
        end
        
        if i<Ny
        south=cell_number(i+1,j);  Aconv(centre,south)=a_s;
        end
        
        if j<Nx
        east=cell_number(i,j+1);   Aconv(centre,east)=a_e;
        end
        
        if j>1
        west=cell_number(i,j-1);   Aconv(centre,west)=a_w; 
        end
       
        bconv(centre,1)=rhs; 
    end
end































