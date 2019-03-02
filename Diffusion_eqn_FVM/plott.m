%Contour Plot:
figure(1)
contour(X(2:end,2:end)-delx/2,Y(2:end,2:end)-dely/2,phi);   %phi values are plotted at the cell centres

colorbar 
grid off
view(0,-90)
movegui(figure(1),'northwest')
axis equal 

drawnow
pause(0.005);



%Surf plot:
figure(2)
 
surf(X(2:end,2:end)-delx/2,Y(2:end,2:end)-dely/2,phi);   %phi values are plotted at the cell centres
shading interp
colorbar 
grid off
view(0,-90)
movegui(figure(2),'northeast')
axis equal 

drawnow
pause(0.005);

%Surf with grid plot:
figure(3)
 
surf(X(2:end,2:end)-delx/2,Y(2:end,2:end)-dely/2,phi);   %phi values are plotted at the cell centres
 
colorbar 
grid off
view(0,-90)
movegui(figure(3),'north')
axis equal 

drawnow
pause(0.005);
 
