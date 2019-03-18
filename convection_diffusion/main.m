%Convection-diffusion

%Mesh:
Mesh

%Time:
Time

%Initialize:
Initialize

%Material_properties:
Material_properties

%Bcs:
Bcs

%Video record: 
v = VideoWriter('CD.avi');   %Change video file name if you want.
FrameRate=10; 
open(v);


for t=1:Nt
	%Operators:
	convection
	laplacian
	ddt

	%PDE:
	A=Addt+Aconv-tau*Alaplacian;    
	b=bddt+bconv-tau*blaplacian;

	%Solve:
	phi=A\b;
	 
	%plot:
	plott
	
	frame = getframe(gcf);   %record frames
	writeVideo(v,frame);	
	
end

close(v); %close video file  













