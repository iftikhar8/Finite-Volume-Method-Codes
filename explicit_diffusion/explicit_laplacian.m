function L=explicit_laplacian(phi)
%returns laplacian at cell centres:
global Nx Ny hx hy

L=zeros(Ny,Nx);

%Interior cells:

L(1:end-1,:)=L(1:end-1,:)+(phi(2:end,:)-phi(1:end-1,:))*(1/hy*hy);
L(2:end,:)=L(2:end,:)+(phi(1:end-1,:)-phi(2:end,:))*(1/hy*hy);
L(:,1:end-1)=L(:,1:end-1)+(phi(:,2:end)-phi(:,1:end-1))*(1/hx*hx);
L(:,2:end)=L(:,2:end)+(phi(:,1:end-1)-phi(:,2:end))*(1/hx*hx);


%Load Bcs:
Bcs

%Boundary cells:

if strcmp(str_top,'fixed value')
	L(1,:)=L(1,:)+(phi_top-phi(1,:))*(2/hy*hy);
else 
	L(1,:)=L(1,:)+gradient_top*(1/hy);	
end


if strcmp(str_bottom,'fixed value')
	L(end,:)=L(end,:)+(phi_bottom-phi(end,:))*(2/hy*hy);
else 
	L(end,:)=L(end,:)+gradient_bottom*(1/hy);
end

if strcmp(str_left,'fixed value')
	L(:,1)=L(:,1)+(phi_left-phi(:,1))*(2/hx*hx);
else 
	L(:,1)=L(:,1)+gradient_left*(1/hx);
end

if strcmp(str_right,'fixed value')
	L(:,end)=L(:,end)+(phi_right-phi(:,end))*(2/hx*hx);
else 
	L(:,end)=L(:,end)+gradient_right*(1/hx); 
end



























