%{
    -- Entrada
    n           : Número de reinas
    semilla     : Entero para el inicio de los datos
    temp        : Temperatura inicial
    tempMin     : Temperatura mínima
    costeMin    : Cota del coste
    iterMax     : Número máximo de iteraciones
    
    -- Salida
    reinas      : solución
    coste       : fEval de la solución
    iter        : iteraciones necesarias para llegar
%}

function [reinas, coste, iter] = annealing(n,semilla,temp,tempMin,costeMin)
    % Estado inicial
    rng(semilla);
    
    % Nodos
    Nodes = importdata('tsp.mat');
    % Translación del eje Y
    minY = abs(min(Nodes(:,3)));
    Nodes(:,3) = Nodes(:,3) + minY;

    reinas = randperm(n);
    coste = fEval(reinas, Nodes);

    iter = 0;
    
    while((temp > tempMin) && (coste > costeMin))
        % Generamos el sucesor aleatorio
        [x,costeAux] = randomSuccesor(reinas,2,Nodes);
        deltaE = costeAux - coste;
        
        % El sucesor es mejor que el actual
        if(deltaE < 0)
            coste = costeAux;
            reinas = x;
        else
            % Calculamos la probabilidad
            prob = exp(-deltaE/temp);
            
            % Si supera un rango dado, aceptamos el sucesor.
            if(prob > rand(0,1))
                coste = costeAux;
                reinas = x;
            end
        end

        temp = reducTemp(temp);
        iter = iter+1;
    end
end

function temp = reducTemp(temp)
    temp = temp * 0.95;
end