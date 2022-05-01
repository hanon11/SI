%{
    Algoritmo PMX
    
    -- Entrada
    pob     : Población actual
    pCross  : Probabilidad que tienen dos individuos de mezclarse

    -- Salida
    newPob  : Población resultante
%}

function [newPob] = pmx(pob, pCross)
    n = size(pob,2);
    nPob = size(pob,1);
    newPob = zeros(nPob,n);

    for i = 1:2:nPob
        p = rand();

        % Si supera la probabilidad
        if p > pCross
            % Seleccionamos los dos puntos al azar
            punto1 = floor(1 + rand()*(n-3));
            punto2 = floor((punto1+1) + rand()*(n-punto1-1));

            % Conjunto de ínidices que identifican las partes
            indicesInicio = 1:punto1;
            indicesMedio = punto1+1:punto2;
            indicesFin = punto2+1:n;

            % Intercambiamos las zonas centrales
            newPob(i,indicesMedio) = pob(i+1,indicesMedio);
            newPob(i+1,indicesMedio) = pob(i,indicesMedio);

            % Valores no repetido del inicio del vector
            newPob(i,:) = copiaDiferentesInicio(newPob(i,:), indicesMedio, ...
                                            pob(i,:), indicesInicio);
            newPob(i+1,:) = copiaDiferentesInicio(newPob(i+1,:), indicesMedio,...
                                            pob(i+1,:), indicesInicio);
            
            % Valores no repetidos del final del vector
            newPob(i,:) = copiaDiferentesFinal(newPob(i,:), 1:punto2, ...
                                            pob(i,:), indicesFin);
            newPob(i+1,:) = copiaDiferentesFinal(newPob(i+1,:), 1:punto2, ...
                                            pob(i+1,:), indicesFin);

            % Valores que se repiten y que deben ser buscados en el vector
            newPob(i,:) = fueraCeros(newPob(i,:),pob(i,:));
            newPob(i+1,:) = fueraCeros(newPob(i+1,:),pob(i+1,:));

        % Si no la supera
        else
            newPob(i,:) = pob(i,:);
            newPob(i+1,:) = pob(i+1,:);
        end
        
    end    
end

function newPob = copiaDiferentesInicio(newPob, indSec, pob, indSecIni)
    % Comprobamos la existencia o no de los valores
    % ¿Aparecen los valores de sec1(indicesInicio) en sec12(indicesMedio)'?
    % Los que no aparezca devuelve los indices
    if length(indSec) > 1
        indNo = find(~any(pob(indSecIni) == newPob(indSec)'));
    else
        indNo = find((pob(indSecIni) ~= newPob(indSec)'));
    end

    % Si existe algún índice
    if ~isempty(indNo)
        newPob(indNo) = pob(indNo);
    end
end

function newPob = copiaDiferentesFinal(newPob, indSec, pob, indSecIni)
    % Lo mismo pero para los indices de los elementos del final. Comprobamos si
    % los elementos ya existen en el vector que llevamos hasta ahora, con los
    % elementos del inicio ya insertados.
    % Hacemos n - find(...)+1 para que los índices del vector lógico queden
    % en una función biyectiva:
    %       f(1) = n, f(2) = n-1, f(3) = n-2, ..., f(k) = punto2+1.
    % con k la cantidad de elementos de la tercera parte del vector delimitada
    % por punto2+1 hasta end
    if length(indSec) > 1
        indNo = length(pob) - find(fliplr(~any(pob(indSecIni) == newPob(indSec)'))) + 1;
    else
        indNo = length(pob) - find(fliplr(pob(indSecIni) ~= newPob(indSec)')) + 1;
    end
    
    % Si existe algún índice
    if ~isempty(indNo)
        newPob(indNo) = pob(indNo);
    end
end

function sec = fueraCeros(sec, secInicial)
    % Bucle para sustituir correctamente las posiciones que tienen 0
    while(any(sec==0))
        % Busco la primera posición que tenga 0
        pos0 = find(sec==0,1,"first");
        pos = pos0;
        
        while sec(pos0) == 0
            % Busco la posición en sec12 que tiene el mismo valor que sec1(pos)
            pos = find(sec == secInicial(pos));
    
            % Si el valor que se encuentra en sec1(pos) no existe, lo insertamos
            if ~any(sec == secInicial(pos)')
                sec(pos0) = secInicial(pos);            
            end
        end
    end
end