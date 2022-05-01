%{
    Inserta un alelo propio en entre otro dos del individuo
    
    -- Entrada
    pob : Población actual
    pMut : Probabilidad mínima de que un individuo mute

    -- Salida
    newPob : Nueva población generada
%}

function newPob = insercion(pob, pMut)
    newPob = pob;
    tamIndiv = size(pob,2);

    for i = 1:size(pob,1)
        p = rand();
        
        if p > pMut
            % La posición de los dos genes: pos(1) gen que se va a insertar
            % pos(2) gen a partir del que se va a insertar
            posGenes = sort(randperm(tamIndiv,2));
            
            % Construimos el nuevo individuo insertando el valor
            newPob(i,:) = [ pob(i,1:posGenes(1)-1) ...
                            pob(i,posGenes(1)+1:posGenes(2)) ...
                            pob(i,posGenes(1)) ...
                            pob(i,posGenes(2)+1:tamIndiv) ];
        end
    end
end