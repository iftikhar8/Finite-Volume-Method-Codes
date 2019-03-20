%Diffusion

%Mesh:
Mesh

%Time:
Time

%Initialize:
Initialize

%Material_properties:
Material_properties

 

%Video record: 
v = VideoWriter('2.avi');   %Change video file name if you want.
 
FrameRate=.01; 
open(v);


for t=1:Nt

	%laplacian:
	L=explicit_laplacian(phi);
	
	%diffusion eqn:
	phi=phi+tau*dt*L;

	%plot:
	plott
	
	frame = getframe(gcf);   %record frames
	writeVideo(v,frame);
	 
end

close(v); %close video file  
 










