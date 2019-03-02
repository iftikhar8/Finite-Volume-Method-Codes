Z = peaks;
surf(Z); 
 
 
v = VideoWriter('peaks.avi');
open(v);

for k = 1:20 
   surf(sin(2*pi*k/20)*Z,Z)
   frame = getframe(gcf);
   writeVideo(v,frame);
end

close(v);