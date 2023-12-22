function [pxo, pyo] = zad2a(filename, options, ft)
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
nx = [10, 20, 20, 30];
ny = [10, 30, 20, 30];

[pxo, pyo] = estimation_manager(filename, nx, ny, ...
    @implicit_euler, options, ft);

end % function