%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modelowanie Matematyczne 2023/2024 - semestr zimowy
% Projekt 1: Rozwiazywanie ukladow rownan rozniczkowych zwyczajnych
% Autor: Adam Gracikowski, 327350
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars; close all;
tspan = [0 8];

% zadanie 1:
[y1dsolve, y2dsolve] = problem1dsolve();

% zadanie 2:

% a) ode45:
[tode45, y1ode45, y2ode45] = problem2ode45();

% b) metoda 1:
h1 = 0.001;
[t1, y1m1, y2m1] = problem2method1(h1);

% b) metoda 2:
h2 = 0.001;
[t2, y1m2, y2m2] = problem2method2(h2);

% c) metoda 3:
h3 = 0.001;
[t3, y1m3, y2m3] = problem2method3(h3);

% zadanie 3:

y1d = matlabFunction(y1dsolve);
y2d = matlabFunction(y2dsolve);

% a) metoda 1:

h_min1 = 0.001;
h_max1 = 3;
dh1 = 0.001;
vh1 = h_min1:dh1:h_max1;

[are1m1, are2m1] = problem3(vh1, y1d, y2d, @problem2method1);

% b) metoda 2:

h_min2 = 0.001;
h_max2 = 3;
dh2 = 0.001;
vh2 = h_min2:dh2:h_max2;

[are1m2, are2m2] = problem3(vh2, y1d, y2d, @problem2method2);
 
% c) metoda 3:

h_min3 = 0.001;
h_max3 = 5;
dh3 = 0.001;
vh3 = h_min3:dh3:h_max3;

[are1m3, are2m3] = problem3(vh3, y1d, y2d, @problem2method3);

% tworzenie wykresow y1, y2 dla roznych metod:

subplot(2, 3, 1);
fplot(y1dsolve, tspan);
adjustAxes(gca, 1);
hold on;
fplot(y2dsolve, tspan);
title('dsolve');
legend('y_1', 'y_2');
hold off;

subplot(2, 3, 2);
plot(tode45, y1ode45, tode45, y2ode45);
adjustAxes(gca, 1);
title('ode45');
legend('y_1', 'y_2');

subplot(2, 3, 3);
plot(t1, y1m1, t1, y2m1);
adjustAxes(gca, 1);
title('metoda 1: udoskonalona Eulera');
legend('y_1', 'y_2');

subplot(2, 3, 4);
plot(t2, y1m2, t2, y2m2);
adjustAxes(gca, 1);
title('metoda 2: Adamsa-Bashfortha 3-ego rzędu');
legend('y_1', 'y_2');

subplot(2, 3, 5);
plot(t3, y1m3, t3, y2m3);
adjustAxes(gca, 1);
title('metoda 3: Rungego-Kutty z 3 etapami');
legend('y_1', 'y_2');

% tworzenie wykresow zagregowanych bledow dla roznych metod:

figure;
subplot(1, 3, 1);
loglog(vh1, are1m1, vh1, are2m1);
adjustAxes(gca, 0);
title('metoda 1: udoskonalona Eulera');
legend('\delta_1(h)', '\delta_2(h)', 'Location','southeast');

subplot(1, 3, 2);
loglog(vh2, are1m2, vh2, are2m2);
adjustAxes(gca, 0);
title('metoda 2: Adamsa-Bashfortha 3-ego rzędu');
legend('\delta_1(h)', '\delta_2(h)', 'Location','southeast');

subplot(1, 3, 3);
loglog(vh3, are1m3, vh3, are2m3);
adjustAxes(gca, 0);
title('metoda 3: Rungego-Kutty z 3 etapami');
legend('\delta_1(h)', '\delta_2(h)', 'Location','southeast');

function [] = adjustAxes(ax, p)
    if p
        ax.XLim = [0 8];
        ax.YLim = [-0.02 0.1];
    end
    ax.XGrid = "on";
    ax.XMinorGrid = "on";
    ax.YGrid = "on";
    ax.YMinorGrid = "on";
end