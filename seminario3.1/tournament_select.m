function parents = tournament_select(poblacion, k, fEval)
    tam = width(poblacion);
    parents = zeros(2, tam);
    evaluacion = zeros(tam,1);
    for i=1:height(poblacion)
        evaluacion(i) = fEval(poblacion(i,:));
    end
    indice = 1;
    while ~isempty(find(parents == 0, 1))
        escogidos = escoge_k_tournament(poblacion, k);
        max = 0;
        pos =1;
        for i=1:k
            if poblacion(i,end) > max
                max = poblacion(i,end);
                pos = i;
            end
        end
        parents(i) = poblacion(pos, 1:end-1);%todo menos la ultima pos (eval)
    end
end