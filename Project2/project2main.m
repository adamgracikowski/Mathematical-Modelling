%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modelowanie Matematyczne 2023/2024 - semestr zimowy
% Projekt 2: Estymacja parametrów modelu Lotki-Volterry
% Autor: Adam Grącikowski, 327350
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% symulacja dla pliku: dane15.csv

filename = "dane15.csv";
dataTable = readtable(filename);
options = struct('xp', dataTable.x, ...
    'yp', dataTable.y, ...
    'tp', dataTable.t, ...
    'ft', @(t) t, ...
    'set1', [], ...
    'set2a', optimset('MaxFunEvals', 4000), ...
    'set2b', [], ...
    'set3a', optimset('MaxIter', 4000, 'MaxFunEvals', 5000), ...
    'set3b', optimset('MaxIter', 3000, 'MaxFunEvals', 3000), ...
    'h', 0.01);

symulation(filename, options);

% symulacja dla pliku: HudsonBay.csv

filename = "HudsonBay.csv";
dataTable = readtable(filename);
dataTable.Properties.VariableNames = {'t', 'x', 'y'};
options = struct('xp', dataTable.x, ...
    'yp', dataTable.y, ...
    'tp', dataTable.t, ...
    'ft', @(t) rescale(t, 0, 3), ...
    'set1', [], ...
    'set2a', [], ...
    'set2b', optimset('MaxIter', 4000, 'MaxFunEvals', 4000), ...
    'set3a', optimset('MaxIter', 4000, 'MaxFunEvals', 4000), ...
    'set3b', optimset('MaxIter', 4000, 'MaxFunEvals', 4000), ...
    'h', 0.01);

symulation(filename, options);