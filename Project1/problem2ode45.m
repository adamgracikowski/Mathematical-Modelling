function [tode45, y1ode45, y2ode45] = problem2ode45()
% Projekt 1, Zadanie 2: a) ode45
% Adam Gracikowski, 327350
%
% OUTPUT:
% t         - wektor punktow czasowych
% y1        - wektor wartosci funkcji y1 w punktach czasowych t
% y2        - wektor wartosci funkcji y2 w punktach czasowych t

tspan = [0, 8];
ic = [0, 0];
A = [-2, -2; 2, -7];

x = @(t) exp(-t).*sin(t);
f = @(t, y) A*y + x(t);

[tode45, v] = ode45(f, tspan, ic);
y1ode45 = v(:, 1);
y2ode45 = v(:, 2);

end % function