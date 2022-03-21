function S = sucesores_taboo(v, r)
    S = [zeros(length(v)-1, length(v))];
    x = v;
    indice = 1;
    primera = true;
    for j=r+1:1:length(v)
        x = v;
        x([r j]) = x([j r]);
        S(indice, 1) = fEval(x);
        S(indice, 2:length(v)+1) = x;
        if (primera == true)
            S(indice, end+1) = r;
            S(indice, end+1) = j;
            primera = false;
        else
            S(indice, end-1) = r;
            S(indice, end) = j;
        end
        indice = indice + 1;

    end
    S = sortrows(S);
    S = S(:,2:end);
end
