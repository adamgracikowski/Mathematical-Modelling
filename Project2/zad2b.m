function [pxo, pyo] = zad2b(filename, options, ft)
% Project 2
% Adam Grącikowski, 327350
%
% INPUT:
%   filename - nazwa pliku z danymi na temat liczebności dwóch gatunków
%   options - argument typu optimset modyfikujący wywołanie funkcji
%             fmisearch wewnątrz estimation_manager, domyślnie []
%   ft - uchwyt do funkcji skalującej wektor czasu, domyślnie ft(t) = t
% OUTPUT:
%   pxo - optymalne parametry dla pierwszego równania różniczkowego
%   pyo - optymalne parametry dla drugiego równania różniczkowego

if nargin < 3; ft = @(t) t; end
if nargin < 2; options = []; end

% gęstość próbkowania wskazanych przedziałów
nx = [20, 20, 20, 50];
ny = [20, 20, 20, 20];

[pxo, pyo] = estimation_manager(filename, nx, ny, ...
    @adams_bashforth, options, ft);

end % function