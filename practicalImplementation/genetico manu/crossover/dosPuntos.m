%{
    Implementación de la técnica de cruze dos puntos

    -- Entrada
    pob     : Población actual
    pCross  : Probabilidad que tienen dos individuos de mezclarse

    -- Salida
    newPob  : Población resultante    
%}

function newPob = dosPuntos(pob, pCross)
    n = size(pob,2);
    nPob = size(pob,1);
    newPob = zeros(nPob,n);

    for i=1:2:nPob
        p = rand();

        if p > pCross
            % Seleccionamos los dos puntos al azar
            puntos = randperm(n-1,2);
            punto1 = puntos(1);
            punto2 = puntos(2);
            
            % Hacemos el intercambio
            newPob(i,:) = [pob(i+1,1:punto1) pob(i,punto1+1:punto2) pob(i+1,punto2+1:end)];
            newPob(i+1,:) = [pob(i,1:punto1) pob(i+1,punto1+1:punto2) pob(i,punto2+1:end)];
        else
            newPob(i,:) = pob(i,:);
            newPob(i+1,:) = pob(i+1,:);
        end
    end    
end