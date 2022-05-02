function coste = fEval(indiv, Nodes)
    % Carga de datos
    %Nodes = importdata('tsp.mat');
    
    % Translación del eje Y
    minY = min(Nodes(:,3));
    Nodes(:,3) = Nodes(:,3) + abs(minY);
    
    coste = 0;
    for i = 1:length(indiv)-1
        coste = coste + distancia(Nodes(indiv(i),2:3)',Nodes(indiv(i+1),2:3)');
    end

    coste = coste + d_euclid(Nodes(indiv(1),2:3)',Nodes(indiv(end),2:3)');
end

function d = distancia(x,y)
    aux=x-y*ones(1,size(x,2));
    d=norma(aux);
end