function S = sucesores(v)
    %matriz con todos los sucesores posibles del estado actual (v)
    sumatorio = 0;
    for i=1:1:length(v)-1
       sumatorio = sumatorio+i;
    end
    S = [zeros(sumatorio, length(v))];
    x = v;
    indice = 1;
    primera = true;
    for i=1:1:length(v)
        for j=i+1:1:length(v)
            x = v;
            x([i j]) = x([j i]);
            S(indice, 1) = fEval(x);
            S(indice, 2:length(v)+1) = x;
            if (primera == true)
                S(indice, end+1) = i;
                S(indice, end+1) = j;
                primera = false;
            else
                S(indice, end-1) = i;
                S(indice, end) = j;
            end
            indice = indice + 1;
        end
    end
    S = sortrows(S);
    S = S(:,2:end);
end
