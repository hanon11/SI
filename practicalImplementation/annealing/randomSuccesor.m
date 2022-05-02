%{
    -- Entrada
    reinas  : Permutación actual
    n       : Número de reinas que se van a intercambiar entre sí
    Nodes   : Nodos (normalizados a >0) cargados desde tsp.mat
%}

function [reinas, coste] = randomSuccesor(reinas, n, Nodes)
    % Posiciones que se van a intercambiar
    reinasPerm = randperm(length(reinas),n);

    aux = reinas(reinasPerm(end));
    reinas(reinasPerm(end)) = reinas(reinasPerm(1));

    for i = n-1:-1:1
        % Siguiente reina
        posReina = reinasPerm(i);
        
        % Intercambiamos las posiciones
        aux2 = reinas(posReina);
        reinas(posReina) = aux;

        aux = aux2;
    end
    
    % Calculamos su coste
    coste = fEval(reinas,Nodes);
end