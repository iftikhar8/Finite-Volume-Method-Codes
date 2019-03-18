%Convection

%Mesh:
Mesh

 
%Initialize:
Initialize

%Material_properties:
Material_properties

%Bcs:
Bcs

 

 
	%Operators:
	convection
	 
	%PDE:
	A=Aconv;    
	b=bconv;

	%Solve:
	phi=A\b;
	 
	%plot:
	plott
	
	frame = getframe(gcf);   %record frames
	 
	
 

 













