%{
    Invierte una sección del individuo
    
    -- Entrada
    pob : Población actual
    pMut : Probabilidad mínima de que un individuo mute

    -- Salida
    newPob : Nueva población generada
%}

function newPob = inversion(pob, pMut)
    newPob = pob;
    tamIndiv = size(pob,2);

    % Recorrido de todos los individuos de la población
    for i = 1:size(pob,1)
        % Probabilidad aleatoria para el individuo
        p = rand();
        
        if p > pMut
            % Parte entera de un valor aleatorio de [1,tamIndiv)
            punto1 = floor(1 + rand()*(tamIndiv-1));
            % Parte entera de un valor aleatorio de [(punto1+1),tamIndiv]
            punto2 = floor((punto1+1) + rand()*(tamIndiv-punto1));
            
            % Invertimos la sección
            newPob(i,punto1:punto2) = fliplr(pob(i,punto1:punto2));
        end
    end
end