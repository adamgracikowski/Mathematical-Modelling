function [pxo, pyo, xe, ye] = zad3a(filename, px, py, options, ft)
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
% OUTPUT:
%   pxo - optymalne parametry dla pierwszego równania różniczkowego
%   pyo - optymalne parametry dla drugiego równania różniczkowego
%   xe - estymaty wartości funkcji x uzyskane przy pomocy ode45
%   ye - estymaty wartości funkcji y uzyskane przy pomocy ode45

if nargin < 5; ft = @(t) t; end
if nargin < 4; options = []; end

% wczytanie danych syntetycznych
dataTable = readtable(filename);
dataTable.Properties.VariableNames = {'t', 'x', 'y'};
xp = dataTable.x;
yp = dataTable.y;
tp = ft(dataTable.t);

% wywołanie fminsearch
p_opt = fminsearch(@matchingIndicator, [px, py], options);
pxo = p_opt(1:4);
pyo = p_opt(5:end);

[xe, ye] = ode_45(tp, p_opt);

    function J = matchingIndicator(p)
        [xe, ye] = ode_45(tp, p);
        J = sum((xe - xp).^2) + sum((ye - yp).^2);
    end
    function [xe, ye] = ode_45(tp, p)
        px = p(1:4); py = p(5:end);
        [t, v] = ode45(@f, [min(tp) max(tp)], [px(4) py(4)]);
        xe = interp1(t, v(:,1), tp);
        ye = interp1(t, v(:,2), tp);
        function dvdt = f(~, v)
            x = v(1);
            y = v(2);
            dvdt = [px(1)*x + px(2)*x.*y + px(3)*x.*x; ...
                py(1)*y + py(2)*x.*y + py(3)*y.*y];
        end
    end
end % function