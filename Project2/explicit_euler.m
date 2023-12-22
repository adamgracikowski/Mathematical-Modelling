function ve = explicit_euler(p, tp, up)
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

% wartość początkowa
ve(1) = p(end);

for i = 2:length(ve)
    dt = tp(i) - tp(i-1);
    ve(i) = ve(i-1) + f(ve(i-1), up(i-1))*dt;
end % for

end % function