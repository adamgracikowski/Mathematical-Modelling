function ve = implicit_euler(p, tp, up)
% Project 2
% Adam Grącikowski, 327350
%
% INPUT:
%   p - parametry dla równania różniczkowego, czyli zestaw: 
%       (r_x, r_xy, r_xx, x_1) lub (r_y, r_yx, r_yy, y_1)
%   tp - wektor wartości czasu z pomiarów
%   up - wartości liczebności populacji z pomiarów
% OUTPUT:
%   ve - wektor obliczonych estymat liczbności populacji

ve = 0*up;

% wartość początkowa
ve(1) = p(4);

for i = 2:length(ve)
    dt = tp(i) - tp(i-1);
    % w każdej iteracji rozwiązujemy równanie kwadratowe
    [x1, x2] = solve_quadratic([p(3)*dt, p(1)*dt + p(2)*up(i)*dt - 1, ve(i-1)]);
    % wybieramy większe rozwiązanie
    ve(i) = max(x1, x2);
end % for

    function [x1, x2] = solve_quadratic(p)
        % funkcja rozwiązująca równanie kwadratowe
        a = p(1); b = p(2); c = p(3);
        delta = b^2 - 4*a*c;
        if delta < 0
            x1 = NaN;
            x2 = NaN;
            return;
        end % if
        % unikamy odejmowania liczb bliskich 
        % i związanych z nim błędów numerycznych
        x1 = (-b - sign(b)*sqrt(delta)) / (2*a);
        x2 = c / (a * x1);
    end
end % function