function [t, y1, y2] = problem2method2(h)
% Projekt 1, Zadanie 2: b) method2
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

t = tspan(1):h:tspan(2);

n = size(t, 2);
y = zeros(2, n);
y(:, 1) = ic;
I = eye(2);

% jawna metoda Eulera w chwili t2
if n >= 2
    y(:, 2) = h*A*y(:, 1) + h*x(t(1));
end % if

for i = 3:n
    y(:, i) = (I - 5/12*h*A)\(y(:, i-1) + h/12 * ...
        (5*x(t(i)) + 8*(A*y(:, i-1) + x(t(i-1))) - ...
        (A*y(:, i-2) + x(t(i-2)))));
end % for

y1 = y(1, :);
y2 = y(2, :);

end % function