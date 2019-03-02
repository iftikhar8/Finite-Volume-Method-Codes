

%Top boundary:
prompt='What is the boundary condition on top wall?Gradient or Fixed value:';
str_top=input(prompt,'s');
if strcmp(str_top,'Fixed value')
    phi_top=input('Please specify the value:');
    
elseif strcmp(str_top,'Gradient') 
    gradient_top=input('Please specify the gradient:');
else 
    display('Please kindly learn to give boundary conditions')
end



%Bottom boundary:
prompt='What is the boundary condition on bottom wall?Gradient or Fixed value:';
str_bottom=input(prompt,'s');
if  strcmp(str_bottom,'Fixed value')
    phi_bottom=input('Please specify the value:');
elseif  strcmp(str_bottom,'Gradient')
    gradient_bottom=input('Please specify the gradient:');
else 
    display('Please kindly learn to give boundary conditions')
end


%Left boundary:
prompt='What is the boundary condition on Left wall?Gradient or Fixed value:';
str_left=input(prompt,'s');
if  strcmp(str_left,'Fixed value')
    phi_left=input('Please specify the value:');
elseif strcmp(str_left,'Gradient')
    gradient_left=input('Please specify the gradient:');
else 
    display('Please kindly learn to give boundary conditions')
end


%Right boundary:
prompt='What is the boundary condition on Right wall?Gradient or Fixed value:';
str_right=input(prompt,'s');
if  strcmp(str_right,'Fixed value')
    phi_right=input('Please specify the value:');
elseif strcmp(str_right,'Gradient')
    gradient_right=input('Please specify the gradient:');
else 
    display('Please kindly learn to give boundary conditions')
end