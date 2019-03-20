 
%contour: 
figure(1) 
contour(x,y,phi);   %phi values are plotted at the cell centres

colorbar 
grid off
view(0,-90)
movegui(figure(1),'northwest')
axis equal 

drawnow
pause(0.005);



%Surf with grid plot:
figure(3)
 
surf(x,y,phi);   %phi _cell values are plotted at the cell centres
 
colorbar 
grid off
view(0,-90)
movegui(figure(3),'north')
axis equal 

drawnow
pause(0.005);
 

%Surf plot:
figure(2)
 
surf(x,y,phi);   %phi  values are plotted at the cell centres
shading interp
colorbar 
grid off
view(0,-90)
movegui(figure(2),'northeast')
axis equal 

drawnow
pause(0.005);

 
