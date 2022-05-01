function [best, C, itera] = taboo(semilla)
    % busqueda tabu. Devuelve el mejor candidato, el coste asociado al
    % mismo y las iteraciones que han sido necesarias para llegar hasta él.
    % Recibe semilla -> para generacion de datos aleatorios igual que el
    % resto de compañeros
    

    %% Datos iniciales
    rng(semilla); 
    Nodes = importdata('tsp.mat');  % cargamos datos
    N=length(Nodes); 
    current = randperm(N); best = current;
    C = fEval(best,Nodes); currentC = C;
    tenure = 12; itera = 0;
    % lista tabu (uint8 para poder restar y que nunca tengamos datos negativos...)
    taboo_list = uint8(zeros(N)); 
    nuevo_estado = false; cambio = 0;
    maxItera = 10000;
    costeAConseguir = 75;
    
    while (C > costeAConseguir && itera < maxItera && cambio ~= N-1) 
        % mientras que el coste sea menor que 75, las iteraciones no
        % superen el umbral de maxItera y no se produzca cambio en N-1 vueltas al algoritmo...
        successors = sucesores(current,Nodes); % sucesores del estado actual
        while(~isempty(successors) && ~nuevo_estado)
            new = successors(1,:);
            cost = new(1);
            perm = new(end-1:end);
            new = new(2:end-2);
            successors = successors(2:end,:);
            % sacamos info del vector que devuelve la funcion sucesores...
            % explicacion de que es cada cosa en la misma funcion
            
            if(cost < C) % si mejoramos el coste actual
                current = new;
                currentC = cost;
                best = current;
                C = currentC;
                nuevo_estado = true;
                cambio =0;
            elseif(taboo_list(perm(1),perm(2)) == 0) 
                % si no mejoramos pero no esta en taboo
                current = new;
                currentC = cost;
                nuevo_estado = true;
                cambio=cambio+1;
            end
        end
        %actualizamos lista tabu
        taboo_list = taboo_list-1;
        taboo_list(perm(1),perm(2)) = tenure;
        nuevo_estado = false;
        itera = itera+1;
    end
end 