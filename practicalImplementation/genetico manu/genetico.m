%{
    -- Entrada
    pob : Población inicial
    pCross : Probabilidad a superar para producirse un cruce entre dos indv.
    pMut : Probabilidad de que ocurra una mutación en un indv.
    maxGeneracion : Pues eso.

    -- Salida
    sol : Individuo con mejor coste
    coste : mejor coste alcanzado
    gen : generación en la que se ha alcanzado la solución
%}

function [sol, coste, gen] = genetico(pob, pCross, pMut, maxGeneracion, coste)
    nPob = size(pob,1);     % Cantidad de individuos
    n = size(pob,2);        % Longitud de los individuos

    % Función de evaluación para la población y para los descendientes
    pobFit = zeros(nPob,1);
    newPobFit = zeros(nPob,1);

    % Nodos
    Nodes = importdata('tsp.mat');
    % Translación del eje Y
    minY = abs(min(Nodes(:,3)));
    Nodes(:,3) = Nodes(:,3) + minY;

    for i=1:size(pob,1)
        pobFit(i) = fEval(pob(i,:),Nodes);
    end

    gen = 1;
    while gen <= maxGeneracion && ~any(pobFit <= coste)
        % Selección
        % Devuelve los indices
        elegidos = roulette(pobFit);
        elegidos = pob(elegidos,:);

        % Cruce
        tempPob = pmx(elegidos,pCross);
    
        % Mutación.
        newPob = inversion(tempPob,pMut);
        for i=1:size(newPob,1)
            newPobFit(i) = fEval(newPob(i,:),Nodes);
        end

        % Reemplazo
        [pob, pobFit] = elitista(pob,pobFit,newPob,newPobFit);
        
        % Aumento de generación
        gen = gen + 1;
    end
    
    solInd = find(pobFit == min(pobFit),1,"first");
    sol = pob(solInd,:);
    coste = pobFit(solInd);
end