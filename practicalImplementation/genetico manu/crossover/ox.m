%{
    Implementación del algoritmo OX

    -- Entrada
    pob : Población actual
    pCross : Probabilidad de cruce
    
    -- Salida
    newPob : Población resultante del cruce
%}

function newPob = ox(pob, pCross)
    n = size(pob,2);        % Tamaño de los individuos
    nPob = size(pob,1);     % Tamaño de la población
    newPob = zeros(nPob,n); % Nueva población

    for i = 1:2:nPob
        p = rand();

        if p > pCross
            % Seleccionar dos puntos al azar
            puntos = randperm(21,2);
            punto1 = min(puntos);
            punto2 = max(puntos);

            % Conjunto de ínidices que identifican las partes
            indicesInicio = 1:punto1;
            indicesMedio = punto1+1:punto2;
            indicesFin = punto2+1:n;
            indicesVariables = [indicesFin indicesInicio indicesMedio];
            
            % Intercambiamos las zonas centrales
            newPob(i,indicesMedio) = pob(i,indicesMedio);
            newPob(i+1,indicesMedio) = pob(i+1,indicesMedio);

            % Rellenamos el resto de los vectores
            newPob(i,:) = rellenar(newPob(i,:),pob(i+1,:),indicesVariables);
            newPob(i+1,:) = rellenar(newPob(i+1,:),pob(i,:),indicesVariables);
        else
            newPob(i,:) = pob(i,:);
            newPob(i+1,:) = pob(i+1,:);
        end
    end
end

function newPob = rellenar(newPob, pob, indicesVariables)
    pos = 1;
    % Recorremos toda la secuencia de enteros en el orden establecido por
    % algoritmo.
    for i = indicesVariables
        % Comprobamos si el valor existe en el vector
        if ~any(newPob == pob(i))
            newPob(indicesVariables(pos)) = pob(i);
            pos = pos + 1;
        end
    end
end
