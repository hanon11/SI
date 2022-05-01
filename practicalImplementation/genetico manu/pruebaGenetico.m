% Generación de la población
clear all;

for i=1:40
    pob(i,:) = randperm(22);
end

%%
i = 1;
vecesAcertado = 0;
itera = 0;
j=1;
for pCross = 0.1:0.1:0.9
    for pMut = 0.0:0.1:0.9
        datos = [pCross, pMut];
        %disp(datos);
        vecesAcertado = 0;
        itera = 0;
        for maxGen = 1000:500:3000
            rng(0);

            [~, coste, gen] = genetico(pob,pCross,pMut,maxGen,75);
            
            if coste <= 75.665
                vecesAcertado=vecesAcertado+1;
                itera = itera+gen;
            end

                costes(j,1)=pCross;
                costes(j,2)=pMut;
                costes(j,3)=coste;
                j=j+1;
        end
        valores(i,1)=pCross;
        valores(i,2)=pMut;
        valores(i,3)=vecesAcertado;
        if vecesAcertado == 0
            valores(i,4) = 0;
        else
            valores(i,4) = itera/vecesAcertado;
        end
        i=i+1;
    end
end
