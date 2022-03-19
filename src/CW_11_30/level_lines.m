x = 0 : 0.01 : 2;
y = 0 : 0.01 : 2;
[X,Y] = meshgrid(x,y);
Z = log(X) + log(Y) - X - Y;
contour(X,Y,Z)