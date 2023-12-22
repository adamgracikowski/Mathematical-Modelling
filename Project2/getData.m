function [tp, xp, yp, Px, Py] = getData(filename, nx, ny, ft)
% Project 2
% Adam Grącikowski, 327350
%
% INPUT:
%   filename - nazwa pliku z danymi na temat liczebności dwóch gatunków
%   nx - wektor określający gęstość próbkowania przedziałów dla parametrów
%        pierwszego równania różniczkowego
%   ny - wektor określający gęstość próbkowania przedziałów dla parametrów
%        drugiego równania różniczkowego
%   ft - funkcja skalująca wartości czasu na zadany przedział, domyślnie
%        funkcja tożsamościowa
% OUTPUT:
%   tp - wektor wartości czasu z pomiarów zawartych w pliku filename
%   xp - wektor wartości funkcji x z pomiarów zawartych w pliku filename
%   yp - wektor wartości funkcji y z pomiarów zawartych w pliku filename
%   Px - macierz, zawierająca wszystkie kombinacje parametrów pierwszego
%        równania, (w jej wierszach kolejno: r_x, r_xy, r_xx, x_1)
%   Py - macierz, zawierająca wszystkie kombinacje parametrów drugiego
%        równania, (w jej wierszach kolejno: r_y, r_yx, r_yy, y_1)

if nargin < 4; ft = @(t) t; end

% wczytanie danych syntetycznych
dataTable = readtable(filename);

dataTable.Properties.VariableNames = {'t', 'x', 'y'};
xp = dataTable.x;
yp = dataTable.y;
tp = ft(dataTable.t);

% próbkowanie wskazanych przedziałów parametrów
px1 = linspace(0, 40, nx(1)); py1 = linspace(-40, 0, ny(1));
px2 = linspace(-1, 0, nx(2)); py2 = linspace(0, 1, ny(2));
px3 = linspace(-0.1, 1, nx(3)); py3 = linspace(-0.1, 0, ny(3));
px4 = linspace(100, 1000, nx(4)); py4 = linspace(10, 200, ny(4));

% tworzenie macierzy kombinacji parametrów
Px = combvec(px1, px2, px3, px4);
Py = combvec(py1, py2, py3, py4);

end % function