veces_acertado = 0;iteraciones = 0;
costeTotal = 0;
tiempoTotal = 0;
best = inf;
for i=1:30
    tStart = tic;
    [individuo, C, itera] = annealing(22,i,5000,0.000000000000000001,75.665);
    tFin = toc(tStart);
    if best > C 
        best = C;
        mejor = individuo;
    end

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

