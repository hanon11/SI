function S = sucesores_taboo(v, r)
    S = [zeros(length(v)-1, length(v)+3)];
    x = v;
    indice = 1;
    for j=1:1:length(v)
        if(j ~= r)
            x = v;
            x([r j]) = x([j r]);
            S(indice, 1) = fEval(x);
            S(indice, 2:length(v)+1) = x;
            
            S(indice, end-1) = r;
            S(indice, end) = j;
            
            indice = indice + 1;
        end

    end
    S = sortrows(S);
    S = S(:,2:end);
end
