function [t, y1, y2] = problem2method1(h)
% Projekt 1, Zadanie 2: b) method1
% Adam Gracikowski, 327350
%
% INPUT:
% h         - krok calkowania
% OUTPUT:
% t         - wektor punktow czasowych
% y1        - wektor wartosci funkcji y1 w punktach czasowych t
% y2        - wektor wartosci funkcji y2 w punktach czasowych t

tspan = [0 8];
ic = [0; 0];
A = [-2 -2; 2 -7];

x = @(t) exp(-t).*sin(t);
f = @(t, y) A*y + x(t);

t = tspan(1):h:tspan(2);

n = size(t, 2);
y = zeros(2, n);
y(:, 1) = ic;

for i = 2:n
    y(:, i) = y(:, i-1) + h/2 * ...
        (f(t(i-1), y(:, i-1)) + ...
        f(t(i-1) + h, y(:, i-1) + h*f(t(i-1), y(:, i-1))));
end % for

y1 = y(1, :);
y2 = y(2, :);

end % function