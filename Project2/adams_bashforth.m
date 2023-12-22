function ve = adams_bashforth(p, tp, up)
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

f = @(v, u) p(1)*v + p(2)*v*u + p(3)*v*v;

ve = 0*up;

% wartości początkowe
ve(1) = p(end);
ve(2) = ve(1) + f(ve(1), up(1)) * ...
    (tp(2) - tp(1));
ve(3) = ve(2) + (3/2 * f(ve(2), up(2)) - 1/2 * f(ve(1), up(1))) * ...
    (tp(3) - tp(2));

for i = 4:length(ve)
    dt = tp(i) - tp(i-1);
    ve(i) = ve(i-1) + 1/12 * (23*f(ve(i-1), up(i-1)) - ...
                16*f(ve(i-2), up(i-2)) + ...
                5*f(ve(i-3), up(i-3)))*dt;
end % for

end % function