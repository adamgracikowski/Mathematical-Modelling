function [are1, are2] = problem3(vh, y1d, y2d, intFunc)
% Projekt 1, Zadanie 3: numerical stability
% Adam Gracikowski, 327350
%
% INPUT:
% vh        - wektor krokow calkowania
% yd1       - dokladne rozwiazanie y1 zwrocone przez dsolve
% yd2       - dokladne rozwiazanie y2 zwrocone przez dsolve
% intFunc   - funkcja implementujaca metode rozwiazywania URRZ
% OUTPUT:
% are1      - zagregowany blad wzgledny dla y1
% are2      - zagregowany blad wzgledny dla y2

are1 = 0*vh;
are2 = 0*vh;

i = 1;
for h = vh
    [t, y1, y2] = intFunc(h);
    are1(i) = aggrelerr(t, y1d, y1);
    are2(i) = aggrelerr(t, y2d, y2);
    i = i + 1;
end

end % function