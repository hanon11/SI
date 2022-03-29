function parents = roulette_wheel(poblacion, fEval)
    prob = zeros(height(poblacion), 1);
    prob_acum = zeros(height(poblacion), 1);
    acumulada = 0;
    for i=1:1:height(poblacion)
        prob(i) = fEval(poblacion(i,:))/height(poblacion);
        acumulada = acumulada + prob(i);
        prob_acum(i) = acumulada;
    end

    nueva_poblacion = zeros(1, height(poblacion));
    for i=1:1:length(nueva_poblacion)
        number = rand(1);
        indices = find(prob_acum >= number);
        escogido = indices(1);
        nueva_poblacion(i) = poblacion(escogido); 
    end
end