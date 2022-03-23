function S = sucesores(v)
    %matriz con todos los sucesores posibles del estado actual (v)
    sumatorio = 0;
    for i=1:1:length(v)-1
       sumatorio = sumatorio+i;
    end
    S = [zeros(sumatorio, length(v)+3)];
    x = v;
    indice = 1;
    primera = true;
    for i=1:1:length(v)
        for j=i+1:1:length(v)
            x = v;
            x([i j]) = x([j i]);
            S(indice, 1) = fEval(x);
            S(indice, 2:length(v)+1) = x;
            S(indice, end-1) = i;
            S(indice, end) = j;
            indice = indice + 1;
        end
    end
    S = sortrows(S);
end
