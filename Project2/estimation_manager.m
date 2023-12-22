function [pxo, pyo] = estimation_manager(filename, nx, ny, f, options, ft)
% Project 2
% Adam Grącikowski, 327350
%
% Funkcja realizująca część wspólną rozwiązywanego w zadaniach 1. i 2. 
% problemu estymacji parametrów modelu
% INPUT:
%   filename - nazwa pliku z danymi na temat liczebności dwóch gatunków
%   nx - wektor określający gęstość próbkowania przedziałów dla parametrów
%        pierwszego równania różniczkowego
%   ny - wektor określający gęstość próbkowania przedziałów dla parametrów
%        drugiego równania różniczkowego
%   f - iteracyjna metoda do rozwiązywania pojedynczego równania
%       różniczkowego
%   options - argument typu optimset modyfikujący wywołanie funkcji
%             fmisearch wewnątrz estimation_manager
%   ft - uchwyt do funkcji skalującej wektor czasu
% OUTPUT:
%   pxo - optymalne parametry dla pierwszego równania różniczkowego
%   pyo - optymalne parametry dla drugiego równania różniczkowego

if nargin < 6; ft = @(t) t; end
if nargin < 5; options = []; end

[tp, xp, yp, Px, Py] = getData(filename, nx, ny, ft);
tp = ft(tp);

px_min = 0*nx; py_min = 0*ny;
Jx_min = Inf; Jy_min = Inf;

% liczba wszystkich kombinacji parametrów pierwszego równania
nC = size(Px, 1);
% szukanie najmniejszej wartości Jx
for i = 1:nC
    xe = f(Px(i,:), tp, yp);
    Jx = sum((xe - xp).^2);
    if Jx < Jx_min
        Jx_min = Jx;
        px_min = Px(i,:);
    end % if
end % for

% liczba wszystkich kombinacji parametrów pierwszego równania
nC = size(Py, 1);
% szukanie najmniejszej wartości Jy
for i = 1:nC
    ye = f(Py(i,:), tp, xp);
    Jy = sum((ye - yp).^2);
    if Jy < Jy_min
        Jy_min = Jy;
        py_min = Py(i,:);
    end % if
end % for

% wywołania fminsearch
matchingIndicatorX = @(p) sum((f(p, tp, yp) - xp).^2);
pxo = fminsearch(matchingIndicatorX, px_min, options);
matchingIndicatorY = @(p) sum((f(p, tp, xp) - yp).^2);
pyo = fminsearch(matchingIndicatorY, py_min, options);

end % function