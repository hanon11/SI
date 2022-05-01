function S = sucesores(v,Nodes)
    % S = matriz con todos los sucesores posibles del estado actual (v)
    sumatorio = 0; 
    % sumatorio llevara la cuenta de los posibles estados a los que podemos
    % llegar en base al tamaño de nuestro estado
    for i=1:1:length(v)-1
       sumatorio = sumatorio+i;
    end
    S = zeros(sumatorio, length(v)+3); % +3 para guardar...
    % en la primera posicion del vector el coste asociado al estado actual
    % posteriormente almacenamos el estado, y en las ultimas dos posiciones
    % guardamos las posiciones a las que hemos realizado la permuta
    x = v;
    indice = 1;
    for i=1:1:length(v)
        for j=i+1:1:length(v)
            x = v;
            x([i j]) = x([j i]);
            S(indice, 1) = fEval(x, Nodes);
            S(indice, 2:length(v)+1) = x;
            S(indice, end-1) = i;
            S(indice, end) = j;
            indice = indice + 1;
        end
    end
    S = sortrows(S); % devolvemos los estados ordenados por coste
end
