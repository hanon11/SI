function [best, C, itera] = taboo(N, cota, semilla, tenure)
    rng(semilla);
    Nodes = importdata('tsp.mat');
    current = randperm(N);
    best = current;
    C = fEval(best,Nodes); 
    currentC = C;

    itera = 0;
    taboo_list = uint8(zeros(N));
    nuevo_estado = false;
    cambio = 0;
    
    while (C > cota && itera < 10000 && cambio ~= N-1)
        successors = sucesores(current,Nodes);
        while(~isempty(successors) && ~nuevo_estado)
            new = successors(1,:);
            cost = new(1);
            perm = new(end-1:end);
            new = new(2:end-2);
            successors = successors(2:end,:);
            
            if(cost < C)
                current = new;
                currentC = cost;
                best = current;
                C = currentC;
                nuevo_estado = true;
                cambio =0;
            elseif(taboo_list(perm(1),perm(2)) == 0)
                current = new;
                currentC = cost;
                nuevo_estado = true;
                cambio=cambio+1;
            end
        end
        
        taboo_list = taboo_list-1;
        taboo_list(perm(1),perm(2)) = tenure;
        nuevo_estado = false;
        itera = itera+1;
    end
end 