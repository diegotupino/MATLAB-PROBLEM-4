function [x,y] = trajectory(h,v0,a,ax,ay)

%conditions%

if h < 0
    error
elseif ay >= 0
    error
end

%equations%

y = [(0.5)*ay,((sind(a))*v0),h];

t = roots(y);
t = 0:(t(t > 0)/1000):t(t > 0);

y = polyval(y, t);
y  = y(y >= 0);

x = [((0.5)*ax),((cosd(a))*v0),0];
x = polyval(x,t);
x = x(1:(length(y)));

X = v0*t*cosd(a);
X = X(1:(length(y)));

%Plotting%

plot(x,y,'g--')
grid on
hold on

plot(X,y,'r-')
legend('Non-Ideal Motion','Ideal Motion')
title('Trajectory')
xlabel('Horizontal distance')
ylabel('Vertical height ')
hold off

end