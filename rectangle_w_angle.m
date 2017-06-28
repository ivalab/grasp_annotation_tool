function [XY]=rectangle_w_angle(x, y, w, h, angle)
%RECTANGLE('Position', [x y w h])
%w=3; %width
%h=2; %height
%x=0.2;y=1; %corner position
xv=[x x+w x+w x x];yv=[y y y+h y+h y];
%figure(1), plot(xv,yv);axis equal;

xv = xv - x;
yv = yv - y;
%rotate angle alpha
R(1,:)=xv;R(2,:)=yv;
alpha=angle*2*pi/360;
XY=[cos(alpha) -sin(alpha);sin(alpha) cos(alpha)]*R;

XY = XY + repmat([x;y],1,5);
hold on;plot(XY(1,:),XY(2,:),'r');
axis([0 640 0 480])

end