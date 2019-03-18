%Diffusion:

%Initialize:
Adiff=zeros(Ncells,Ncells);
bdiff=zeros(Ncells,1);

%run over interior cells:
for celli=2:Ncells-1
	%Compute coefficients:
	aw=0;ap=0;ae=0;b=0;
	aw=Gamma/dx;
	ae=Gamma/dx;
	ap=-2*Gamma/dx;
	
	%Matrix fill:
	west=celli-1;
	centre=celli;
	east=celli+1;
	Adiff(centre,west)=aw;
	Adiff(centre,centre)=ap;
	Adiff(centre,east)=ae;
	bdiff(centre,1)=0;	
end

%Access boundary cells:

%Left_cell:
celli=1;
%Compute coefficients:
	aw=0;ap=0;ae=0;b=0;
	b=-2*phi0*Gamma/dx;
	ae=Gamma/dx;
	ap=-3*Gamma/dx;
	
	%Matrix fill:
	 
	centre=celli;
	east=celli+1;
	 
	Adiff(centre,centre)=ap;
	Adiff(centre,east)=ae;
	bdiff(centre,1)=b;

%Right_cell:
celli=Ncells;
%Compute coefficients:
	aw=0;ap=0;ae=0;b=0;
	b=-2*phi1*Gamma/dx;
	aw=Gamma/dx;
	ap=-3*Gamma/dx;
	
	%Matrix fill:
	west=celli-1;
	centre=celli;
	 
	 
	Adiff(centre,centre)=ap;
	Adiff(centre,west)=aw;
	bdiff(centre,1)=b;
