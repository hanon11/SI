clear all;
veces_acertado = 0;
iteraciones = 0;
costeTotal = 0;
costeMedio = 0;
tiempoTotal = 0;
best = inf;
j=1;
for cp=0.8:-0.1:0.1
    for cg=0.9:-0.1:0.1
        for w=0.9:-0.1:0.6
            iteraMedio = 0;
            costeMedio = 0;
            veces_acertado=0;
            best = inf;
            for i=1:30
                [itera, sol, C] =pso(22,i, w,cp,cg);
                if best > C 
                    best = C;
                    %mejor = individuo;
                end
                if C <= 75.665
                    veces_acertado=veces_acertado+1;
                end
                costeMedio=costeMedio+C;
                iteraMedio=iteraMedio+itera;
            end
            valores(j,1)=cp;
            valores(j,2)=cg;
            valores(j,3)=w;
            valores(j,4)=costeMedio/30;
            valores(j,5)=iteraMedio/30;
            valores(j,6)=veces_acertado;
            valores(j,7)=best;
            j=j+1;
        end
    end
end


