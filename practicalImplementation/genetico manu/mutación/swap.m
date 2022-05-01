%{
    Intercambia la posición de dos alelos
    
    -- Entrada
    pob : Población actual
    pMut : Probabilidad mínima de que un individuo mute

    -- Salida
    newPob : Nueva población generada
%}

function newPob = swap(pob, pMut)
    newPob = pob;
    tamIndiv = size(pob,2);

    for i = 1:size(pob,1)
        p = rand();

        if p > pMut
            % Dos genes aleatorios
            genes = randoperm(tamIndiv,2);
            
            % Intercambio de valores
            aux = newPob(i,genes(1));
            newPob(i,genes(1)) = newPob(i,genes(2));
            newPob(i,genes(2)) = aux;
        end
    end
end