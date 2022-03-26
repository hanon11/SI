function parents = roulette_wheel(poblacion, actual)
    prob = zeros(height(poblacion), 1);
    prob_acum = zeros(height(poblacion), 1);
    acumulada = 0;
    for i=1:1:height(poblacion)
        prob(i) = fEval(poblacion(i,:))/height(poblacion);
        acumulada = acumulada + prob(i);
        prob_acum(i) = acumulada;
    end
    costeActual = fEval(actual);
    i = 1;
    while costeActual > prob_acum(i)
        i = i+1;
    end
    parents = poblacion(i);
end