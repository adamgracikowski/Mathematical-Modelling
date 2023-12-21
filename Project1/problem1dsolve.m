function [y1, y2] = problem1dsolve()
% Projekt 1, Zadanie 1: dsolve
% Adam Gracikowski, 327350
%
% OUTPUT:
% y1        - funkcja symboliczna zmiennej y1 rozwazanego URRZ
% y2        - funkcja symboliczna zmiennej y2 rozwazanego URRZ

tspan = [0, 8];
ic = [0; 0];
A = [-2, -2; 2, -7];

syms t x(t) y1(t) y2(t)

x(t) = exp(-t)*sin(t);

dy1 = diff(y1, t, 1);
dy2 = diff(y2, t, 1);

% zdefiniowanie rownan układu:
eqn1 = dy1 == A(1,1)*y1 + A(1,2)*y2 + x;
eqn2 = dy2 == A(2,1)*y1 + A(2,2)*y2 + x;

% okreslenie warunkow poczatkowych:
ic1 = y1(tspan(1)) == ic(1);
ic2 = y2(tspan(1)) == ic(2);

[y1, y2] = dsolve([eqn1 eqn2], [ic1, ic2]);

end % function