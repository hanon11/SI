function [itera, sol] = pso(NReinas)
NTableros = NReinas + 5;
MAX_ITERACIONES=20;
MAXFITNESS=sum(1:NReinas-1);
w = 0.9;
cp = 0.2;
cg = 0.8;
poblacion=generaTableros(NReinas,NTableros);
velocidades = cell(NTableros,1);  %% cada individuo puede tener más o menos velocidades
fitness = EvaluaPoblacion(poblacion);
[val,ind] = max(fitness);
gbest = [poblacion(ind,:),fitness(ind)];
pbest = [poblacion,fitness];
itera = 1;
while (itera<=MAX_ITERACIONES) && gbest(end) < MAXFITNESS %% COMPLETAR resto de condiciones
    for individuo=1:NTableros
        Vi=velocidades{individuo};
        Vi=multiplica(w,Vi);
        Errp=sustraeTableros(poblacion(individuo,:),pbest(individuo,1:NReinas));
        Errg=sustraeTableros(poblacion(individuo,:),gbest(1:NReinas));
        cprp=cp*rand;
        cgrg=cg*rand;
        Vp=multiplica(cprp,Errp);
        Vg=multiplica(cgrg,Errg);
        Vtotal=sumaVelocidades(Vi,Vp);
        Vtotal=sumaVelocidades(Vtotal,Vg);
        poblacion(individuo,:)=aplicaVelocidad(poblacion(individuo,:),Vtotal);
        if ~isempty(Vtotal)
            velocidades{individuo,1}=Vtotal;
        end
        f=EvaluaTablero(poblacion(individuo,:));

    end %% for
    itera=itera+1;
end
if itera > MAX_ITERACIONES
    sol = false;
else 
    sol = true;
end
end