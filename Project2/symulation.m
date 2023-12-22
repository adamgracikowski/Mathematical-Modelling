function [] = symulation(filename, options)
% Project 2
% Adam Grącikowski, 327350
%
% Funkcja wywołująca funkcje z zadaniami od 1 do 4 oraz 
% tworząca odpowiednie wykresy
% INPUT:
%   filename - nazwa pliku z danymi na temat liczebności dwóch gatunków
%   options - struktura zawierająca parametry symulacji

name = strcat("Estymacja dla pliku: ", filename);

tp = options.ft(options.tp);
xp = options.xp;
yp = options.yp;

% zadania 1:
[pxe, pye] = zad1ab(filename, options.set1, options.ft);
xe = explicit_euler(pxe, tp, yp);
ye = explicit_euler(pye, tp, xp);

fig = figure;
set(fig, 'Name', name);

addToPlot([3 2 1], tp, xp, xe, ["$\tilde{x}$", "$\hat{x}$"], ...
    "Estymacja $\tilde{x}$ przy pomocy jawnej metody Eulera");
addToPlot([3 2 2], tp, yp, ye, ["$\tilde{y}$", "$\hat{y}$"], ...
    "Estymacja $\tilde{y}$ przy pomocy jawnej metody Eulera");

% zadanie 2:

% a)
[pxi, pyi] = zad2a(filename, options.set2a, options.ft);
xi = implicit_euler(pxi, tp, yp);
yi = implicit_euler(pyi, tp, xp);

addToPlot([3 2 3], tp, xp, xi, ["$\tilde{x}$", "$\hat{x}$"], ...
    "Estymacja $\tilde{x}$ przy pomocy niejawnej metody Eulera");
addToPlot([3 2 4], tp, yp, yi, ["$\tilde{y}$", "$\hat{y}$"], ...
    "Estymacja $\tilde{y}$ przy pomocy niejawnej metody Eulera");

% b)
[pxa, pya] = zad2b(filename, options.set2b, options.ft);
xa = adams_bashforth(pxa, tp, yp);
ya = adams_bashforth(pya, tp, xp);

addToPlot([3 2 5], tp, xp, xa, ["$\tilde{x}$", "$\hat{x}$"], ...
    "Estymacja $\tilde{x}$ przy pomocy metody Adamsa-Bashfortha");
addToPlot([3 2 6], tp, yp, ya, ["$\tilde{y}$", "$\hat{y}$"], ...
    "Estymacja $\tilde{y}$ przy pomocy metody Adamsa-Bashfortha");

% zadanie 3:

% a)
[pxoa, pyoa, xo, yo] = zad3a(filename, pxe, pye, ...
    options.set3a, options.ft);

fig = figure;
set(fig, 'Name', name);
addToPlot([2 2 1], tp, xp, xo, ["$\tilde{x}$", "$\hat{x}$"], ...
    "Estymacja $\tilde{x}$ przy pomocy ode45, punkt startowy z 1a");
addToPlot([2 2 2], tp, yp, yo, ["$\tilde{y}$", "$\hat{y}$"], ...
    "Estymacja $\tilde{y}$ przy pomocy ode45, punkt startowy z 1b");

% b)
[pxob, pyob, xo, yo] = zad3b(filename, pxa, pya, ...
    options.set3b, options.ft, options.h);

addToPlot([2 2 3], tp, xp, xo, ["$\tilde{x}$", "$\hat{x}$"], ...
    "Estymacja $\tilde{x}$ przy pomocy jawnej metody Eulera, punkt startowy z 2b");
addToPlot([2 2 4], tp, yp, yo, ["$\tilde{y}$", "$\hat{y}$"], ...
    "Estymacja $\tilde{y}$ przy pomocy jawnej metody Eulera, punkt startowy z 2b");

% zadanie 4:

% obliczamy rozwiązania układu określającego stan równowagi dla parametrów
% startowych z zadania 3a:
sol3a = zad4(pxoa, pyoa);

% obliczamy rozwiązania układu określającego stan równowagi dla parametrów
% startowych z zadania 3b:
sol3b = zad4(pxob, pyob);

disp("zadanie 4: " + filename);
disp("sol3a"); disp(sol3a);
disp("sol3b"); disp(sol3b);

    function [] = addToPlot(subplotIdx, tp, vp, ve, subplotLegend, subplotTitle)
        subplot(subplotIdx(1), subplotIdx(2), subplotIdx(3));
        plot(tp, vp, tp, ve);
        adjustAxes(gca);
        legend(subplotLegend(1), subplotLegend(2), ...
            'Interpreter', 'latex', 'FontSize', 13);
        title(subplotTitle, 'Interpreter', 'latex');
    end

    function [] = adjustAxes(ax)
        ax.XGrid = "on";
        ax.XMinorGrid = "on";
        ax.YGrid = "on";
        ax.YMinorGrid = "on";
    end
end