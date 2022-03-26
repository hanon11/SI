function parents = tournament_select(poblacion, k)
    tam = width(poblacion);
    parents = zeros(2, tam);
    for i=1:1:tam*2
        selected = zeros(1,k);
        costes = zeros(1,k);
        for j=1:1:k
            selected(j) = randi(k);
            costes(j) = fEval(poblacion(j,:));
        end
    end
end