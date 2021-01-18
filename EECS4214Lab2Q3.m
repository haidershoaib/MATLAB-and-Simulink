% Lab 2q3 code %

%for t=1:1000%experimenting 1000 times
% Data
n = 1000;%1000 wireless transmitters
radius = 200;%radius
xc = 0;%center point
yc = 0;%center point
% Engine
theta = rand(1,n)*(2*pi);
r = sqrt(rand(1,n))*radius;
x = xc + r.*cos(theta);
y = yc + r.*sin(theta);
% Check
figure(1)
plot(x,y,'.')
title('Plot of 1000 transmitters')
%end

ran = randi([1,n],1,1);

x1 = x(1,ran);
y1 = y(1,ran);

d = [xc,yc;x1,y1];
distance = pdist(d,'euclidean')

figure(2)
histogram(distance)
title('pdf of distance of one transmitter from origin')


%part b

z = zeros(1, n);
for t=1:n
   x2 = x(1,t);
   y2 = y(1,t);
   d2 = [xc,yc;x2,y2];
   distance1 = pdist(d2,'euclidean');
   z(t) = distance1;
end

[MinDist,Index] = min(z);

xmin = x(Index);
ymin = y(Index);

[MaxDist,Index2] = max(z);

xmax = x(Index);
ymax = y(Index);

pd = [MinDist, MaxDist];

figure(3)
histogram(pd)
title('pdf of distance of min and max transmitters from origin')

