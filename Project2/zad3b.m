function [pxo, pyo, xe, ye] = zad3b(filename, px, py, options, ft, h)
% Project 2
% Adam Grącikowski, 327350
%
% INPUT:
%   filename - nazwa pliku z danymi na temat liczebności dwóch gatunków
%   px - parametry dla pierwszego równania różniczkowego
%   py - parametry dla drugiego równania różniczkowego
%   options - argument typu optimset modyfikujący wywołanie funkcji
%             fmisearch, domyślnie []
%   ft - uchwyt do funkcji skalującej wektor czasu, domyślnie ft(t) = t
%   h - długość kroku całkowania, domyślnie h = 0.001
% OUTPUT:
%   pxo - optymalne parametry dla pierwszego równania różniczkowego
%   pyo - optymalne parametry dla drugiego równania różniczkowego
%   xe - estymaty wartości funkcji x uzyskane przy pomocy
%        jawnej metody Eulera
%   ye - estymaty wartości funkcji y uzyskane przy pomocy
%        jawnej metody Eulera

if nargin < 6; h = 0.01; end
if nargin < 5; ft = @(t) t; end
if nargin < 4; options = []; end

% wczytanie danych syntetycznych
dataTable = readtable(filename);
dataTable.Properties.VariableNames = {'t', 'x', 'y'};
xp = dataTable.x;
yp = dataTable.y;
tp = ft(dataTable.t);
t = min(tp):h:max(tp);

% wywołanie fminsearch
p_opt = fminsearch(@matchingIndicator, [px, py], options);
pxo = p_opt(1:4);
pyo = p_opt(5:end);

[xe, ye] = explicit_euler3(tp, p_opt);

    function J = matchingIndicator(p)
        [xe, ye] = explicit_euler3(tp, p);
        J = sum((xe - xp).^2) + sum((ye - yp).^2);
    end
    function [xe, ye] = explicit_euler3(tp, p)
        px = p(1:4); py = p(5:end);
        fx = @(x, y) px(1)*x + px(2)*x*y + px(3)*x*x;
        fy = @(x, y) py(1)*y + py(2)*y*x + py(3)*y*y;
        xe = 0*tp; xe(1) = px(4);
        ye = 0*tp; ye(1) = py(4);
        for i = 2:length(t)
            dt = t(i) - t(i-1);
            xe(i) = xe(i-1) + fx(xe(i-1), ye(i-1))*dt;
            ye(i) = ye(i-1) + fy(xe(i-1), ye(i-1))*dt;
        end % for
        xe = interp1(t, xe, tp);
        ye = interp1(t, ye, tp);
    end
end % function