%{
    Función que selecciona a los candidatos mediante el método roulette
    
    -- Entrada
    candidatos  : Vector con la función de evaluación de los individuos  
    
    -- Salida
    selec       : Índices de los candidatos seleccionados
%}

function selec = roulette(candidatos)
    n = length(candidatos);
    selec = zeros(1,n);

    p = prob(candidatos);
    for i = 1:n
        num = rand();
        % Tomamos el primer candidato que cumple con la condición
        cand = find(p > num,1,'first');
        selec(i) = cand;
    end

end

function p = prob(c)
    % Probabilidad relativa y acumulada de cada uno de los candidatos
    costeTot = sum(c);
    p = c(:,size(c,2))./costeTot;
    p = cumsum(p(:,1));
end