function result = combvec(varargin)
% Project 2
% Adam Grącikowski, 327350
%
% INPUT:
%   varargin - dowolna liczba wektorów poziomych zawierających kolejne
%              wartości, których zestawy różnych kombinacji chcemy znaleźć
% OUTPUT:
%   result - macierz zawierająca w swoich wierszach wszystkie kombinacje
%            wartości zapisanych w wektorach wejściowych

lengths = cellfun(@length, varargin);

% sprawdzenie poprawności parametrów wejściowych
if nargin == 0 || any(lengths == 0)
    result = []; return;
end % if

% liczba wszystkich kombinacji
nC = prod(lengths);
result = zeros(nC, nargin);

for i = 1:nargin
    rep = nC / lengths(i);
    result(:, i) = repmat(reshape(repmat(varargin{i}, rep, 1), [], 1), ...
        size(result, 1)/(rep*lengths(i)), 1); 
    nC = nC / lengths(i);
end % for

end % function