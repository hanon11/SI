function sol = coloreado_grafos(k, m, n_colores, vector)
    sol = vector;
    for c = 1:n_colores
        if isSafe(k, c, m, sol)
            sol(k) = c;
            if((k+1) <= length(m))
                sol = coloreado_grafos(k+1, m, n_colores, sol);
            end
        end
    end
end