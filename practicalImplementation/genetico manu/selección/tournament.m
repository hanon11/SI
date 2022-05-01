%{
    Implementación del algoritmo Tournament

    -- Entrada
    cands   : Vector con la función de evaluación de los individuos
    k       : Valor para la subdivisión de los candidatos

    -- Salida
    selec   : Índices de los candidatos seleccionados
%}
function selec = tournament(cands, k)
    n = length(cands);
    selec = zeros(1,n);
    
    if k < n
        % Bucle para tomar a los n nuevos padres
        for i = 1:n
            % Posiciones elegidas
            pos = randperm(n,k);

            %disp(cands(pos,:));
            
            % Posicion(es) que contienen el valor mínimo del subconjunto de
            % las posiciones 'pos'
            valorMin = find( ...
                min( ...            % El mínimo de esos valores
                    cands(pos) ...  % Valor que hay en las posiciones de 'pos'
                    ) ...
                == cands);          % Posiciones en la que se puede encontrar
                                    % ese valor máximo. Siempre habrá al menos
                                    % una posición que pertenezca a 'pos'
            
            % Significa en cands hay dos posiciones que tienen el mismo
            % valor que el máximo del subconjunto calculado
            if(length(valorMin) > 1)
                % Buscamos cual de los índices es un índice válido
                valorMin = pos(any(valorMin == pos));

                % Si hay mas de una posición valida se elige una aleatoria
                if(length(valorMin) > 1)
                    p = floor(rand() * length(valorMin)) + 1;
                    valorMin = valorMin(p);
                end
            end
            
            % Se introduce el indice del valor máximo
            selec(i) = valorMin;
        end
    else
        % En el caso de que k sea igual a n, siempre se va a devolver el
        % mejor cromosoma
        if k == n
            selec(:) = find(min(cands));
        end
    end
end