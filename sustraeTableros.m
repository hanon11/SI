function intercambios=sustraeTableros(t2,t1)
    %% numero de diferencias existentes entre 2 tableros
    %% intercambios guarda la información necesaria para convertir t1 en t2
    N=length(t1);
    diferencia=(t1==t2); %% SI SON IGUALES -> 1, SINO 0
    intercambios=[];
    taux=t1;
    j=1; i=N; k=1; 
    while sum(diferencia)~=N %quedan elementos que son distintos en ambos tableros
        if diferencia(i) == 0
            display(i);
            j = find(taux == t2(i));
            diferencia(i) = 1;
            diferencia(j) = 1;
            taux([i,j]) = taux([j,i]);
            intercambios(k,:)=[i,j];
            k = k+1;
        end
        i=i-1;
    end
end