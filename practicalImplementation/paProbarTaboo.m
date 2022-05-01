veces_acertado = 0;
iteraciones = 0;
costeTotal = 0;
tiempoTotal = 0;
best = inf;
for i=1:30
    tStart = tic;
    [individuo, C, itera] = SA(22,i);
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

    if valores(i,1) == 1
        valores(i,2) = itera;
    end
end

costeMedio = costeTotal/veces_acertado;
tiempoMedio = tiempoTotal/veces_acertado;



% 
% for tenure=1:20
%     veces_acertado = 0;
%     iteraciones = 0;
%     for i=1:500
%         [best, C, itera] = taboo(i, tenure);
%         if C <= 75.665
%             veces_acertado=veces_acertado+1;
%             iteraciones=iteraciones+itera;
%         end
%     end
%     valores(tenure,1) = tenure;
%     valores(tenure,2) = veces_acertado;
%     valores(tenure,3) = iteraciones/veces_acertado;
% end

% j = 1;
% for temperaturamax = 500:100:1500
%     for temperaturaMin = 0.000:0.01:1
%         for i=1:200
%             [best, C, itera] = SA(22, 75, i, temperaturamax, temperaturaMin);
%             if C <= 75.665
%                 veces_acertado=veces_acertado+1;
%                 iteraciones=iteraciones+itera;
%             end
%         end
%         valores(j,1) = temperaturamax;
%         valores(j,2) = temperaturaMin;
%         valores(j,3) = veces_acertado;
%         if(veces_acertado == 0)
%             valores(j,4) = 0;
%         else 
%             valores(j,4) = iteraciones/veces_acertado;
%         end
%         j = j+1;
%     end 
% end
