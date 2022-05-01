function [itera, sol, mejor] = pso(NReinas, semilla, w, cp, cg)
Nodes = importdata('tsp.mat'); 
NTableros = NReinas + 10;
MAX_ITERACIONES=1000;
MINFITNESS=75.665;
%w = 0.5;
%cp = 0.5;
%cg = 0.5;
poblacion=generaTableros(NReinas,NTableros, semilla);
velocidades = cell(NTableros,1);  %% cada individuo puede tener más o menos velocidades
fitness = EvaluaPoblacion(poblacion,Nodes);
[~,ind] = min(fitness);
gbest = [poblacion(ind,:),fitness(ind)];
pbest = [poblacion,fitness];
itera = 1;
itera_sin_cambio = 0;
while (itera<=MAX_ITERACIONES) && gbest(end) > MINFITNESS && itera_sin_cambio < 2*NTableros%% COMPLETAR resto de condiciones
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
        f=fEval(poblacion(individuo,:),Nodes);

        % actulizamos valores de fitness
        if gbest(end) > f
            gbest = [poblacion(individuo,:),f];
            fitness(individuo) = f;
            pbest = [poblacion,fitness];
            itera_sin_cambio = 0;
        end
    end %% for
    itera_sin_cambio=itera_sin_cambio+1;
    itera=itera+1;
end
if itera > MAX_ITERACIONES
    sol = false;
else 
    sol = true;
end
mejor = gbest(end);
end