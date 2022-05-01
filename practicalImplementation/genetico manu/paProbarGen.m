veces_acertado = 0;
iteraciones = 0;
costeTotal = 0;
tiempoTotal = 0;
best = inf;
for i=1:30
    for j=1:40
        rng(i*j);
        pob(j,:) = randperm(22);
    end
    tStart = tic;
    [individuo, C, itera] = genetico(pob,0.5,0, 1700, 75.665);
    tFin = toc(tStart);
    if best > C 
        best = C;
        mejor = individuo;
    end
    costes(i)= C;

    if C <= 75.665
        valores(i,1) = 1;
        veces_acertado = veces_acertado+1;
        costeTotal = costeTotal+C;
        tiempoTotal =  tiempoTotal+tFin;
    else 
        valores(i,1) = 0;
    end

    
    valores(i,2) = itera;
    
end

costeMedio = costeTotal/veces_acertado;
tiempoMedio = tiempoTotal/veces_acertado;


