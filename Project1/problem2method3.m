function [t, y1, y2] = problem2method3(h)
% Projekt 1, Zadanie 2: c) method3
% Adam Gracikowski, 327350
%
% INPUT:
% h         - krok calkowania
% OUTPUT:
% t         - wektor punktow czasowych
% y1        - wektor wartosci funkcji y1 w punktach czasowych t
% y2        - wektor wartosci funkcji y2 w punktach czasowych t

tspan = [0, 8];
ic = [0; 0];
A = [-2, -2; 2, -7];

x = @(t) exp(-t).*sin(t);

c = [0, 1/2, 1];
w = [1/6, 2/3, 1/6];
a = [1/6, 0, -1/6; 1/12, 5/12, 0; 1/2, 1/3, 1/6];


t = tspan(1):h:tspan(2);

n = size(t, 2);
y = zeros(2, n);
y(:, 1) = ic;
I = eye(2);

hA = h*A;

L = [(I - a(1,1)*hA) (-a(1,2)*hA) (-a(1,3)*hA); ...
     (-a(2,1)*hA) (I - a(2,2)*hA) (-a(2,3)*hA); ...
     (-a(3,1)*hA) (-a(3,2)*hA) (I - a(3,3)*hA)];

for i = 2:n
    p = [A*y(:, i-1) + x(t(i-1) + c(1)*h); ...
         A*y(:, i-1) + x(t(i-1) + c(2)*h);
         A*y(:, i-1) + x(t(i-1) + c(3)*h)];
    g = L\p;
    g = reshape(g, 2, []);

    y(:, i) = y(:, i-1) + h*sum(g.*w, 2);
end % for

y1 = y(1, :);
y2 = y(2, :);

end % function