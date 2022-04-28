veces_acertado = 0;
iteraciones = 0;
% for tenure=1:20
%     veces_acertado = 0;
%     iteraciones = 0;
%     for i=1:200
%         [best, C, itera] = taboo(22, 75, i, tenure);
%         if C <= 75.665
%             veces_acertado=veces_acertado+1;
%             iteraciones=iteraciones+itera;
%         end
%     end
%     valores(tenure,1) = tenure;
%     valores(tenure,2) = veces_acertado;
%     valores(tenure,3) = iteraciones/veces_acertado;
% end

j = 1;
for temperaturamax = 500:100:1500
    for temperaturaMin = 0.000:0.005:1
        for i=1:200
            [best, C, itera] = SA(22, 75, i, temperaturamax, temperaturaMin);
            if C <= 75.665
                veces_acertado=veces_acertado+1;
                iteraciones=iteraciones+itera;
            end
        end
        valores(j,1) = temperaturamax;
        valores(j,2) = temperaturaMin;
        valores(j,3) = veces_acertado;
        if(veces_acertado == 0)
            valores(j,4) = 0;
        else 
            valores(j,4) = iteraciones/veces_acertado;
        end
        j = j+1;
    end
    
end
