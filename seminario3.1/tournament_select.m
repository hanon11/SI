function parents = tournament_select(poblacion, k, fEval)
    tam = length(poblacion);
    alto = height(poblacion);
    parents = zeros(alto, tam+1);
    poblacion = [poblacion fEval];
    indice = 1;
    while ~isempty(find(parents == 0, 1))
        escogidos = escoge_k_tournament(poblacion, k);
        max = inf;
        pos = 1;
        for i=1:k
            if poblacion(escogidos(i),end) < max
                max = poblacion(escogidos(i),end);
                pos = escogidos(i);
            end
        end
        parents(indice, 1:end-1) = poblacion(pos, 1:end-1); %todo menos la ultima pos (eval)
        parents(indice, end) = pos; %todo menos la ultima pos (eval)
        indice = indice+1;
    end
end