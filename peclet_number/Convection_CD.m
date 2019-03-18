%Convection:

%Initialize:
Aconv=zeros(Ncells,Ncells);
bconv=zeros(Ncells,1);




	%run over interior cells:
	for celli=2:Ncells-1
		%Compute coefficients:
		aw=0;ap=0;ae=0;b=0;
		aw=-rho*U/2;
		ap=0;
		ae=rho*U/2;;
	
		%Matrix fill:
		west=celli-1;
		centre=celli;
		east=celli+1;
		Aconv(centre,west)=aw;
		Aconv(centre,centre)=ap;
		Aconv(centre,east)=ae;
		bconv(centre,1)=0;	
	end

	%Access boundary cells:

	%Left_cell:
	celli=1;
	%Compute coefficients:
		aw=0;ap=0;ae=0;b=0;
		b=phi0*rho*U/2;
		ap=rho*U/2;
		ae=rho*U/2;
	
		%Matrix fill:
		 
		centre=celli;
		east=celli+1;
		 
		Aconv (centre,centre)=ap;
		Aconv(centre,east)=ae;
		bconv (centre,1)=b;

	%Right_cell:
	celli=Ncells;
	%Compute coefficients:
		aw=0;ap=0;ae=0;b=0;
		 
		aw=-rho*U/2;
		ap=-rho*U/2;
		b=-rho*U*phi1;
	
		%Matrix fill:
		west=celli-1;
		centre=celli;
		 
		 
		Aconv (centre,centre)=ap;
		Aconv (centre,west)=aw;
                bconv(centre,1)=b;



		
		 
