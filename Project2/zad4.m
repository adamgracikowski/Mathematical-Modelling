function sol = zad4(px, py)
% Project 2
% Adam Grącikowski, 327350
%
% INPUT:
%   px - parametry dla pierwszego równania różniczkowego
%   py - parametry dla drugiego równania różniczkowego
% OUTPUT:
%   sol - macierz zawierająca w swoich wierszach pary wartości (x, y)
%         będące rozwiązaniem rozważanego układu równań nieliniowych

% deklaracja zmiennych symbolicznych
syms x y r_x r_xy r_xx r_y r_yx r_yy real

% zdefiniowanie równań układu
eq1 = r_x * x + r_xy * x * y + r_xx * x^2 == 0;
eq2 = r_y * y + r_yx * x * y + r_yy * y^2 == 0;

sol = solve([eq1, eq2], [x, y]);

% podstawienie wartości pod zmienne symboliczne
sol = subs(sol, [r_x r_xy r_xx r_y r_yx r_yy], [px(1:end-1) py(1:end-1)]);
sol = [double(sol.x), double(sol.y)];

end % function