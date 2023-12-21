function [are] = aggrelerr(t, yd, y)
% Projekt 1, Zadanie 3: aggregate relative error
% Adam Gracikowski, 327350
%
% INPUT:
% t         - wektor punktow czasowych
% yd       - dokladne rozwiazanie y zwrocone przez dsolve
% OUTPUT:
% are1      - zagregowany blad wzgledny dla y

are = sum((y - yd(t)).^2)/sum(yd(t).^2);

end % function

