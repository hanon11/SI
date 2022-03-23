function [best, C, itera] = taboo(N)

    current = randperm(N);
    best = current;
    C = fEval(best); 
    currentC = C;

    itera = 0;
    taboo_list = uint8(zeros(N));
    tenure = 4;
    nuevo_estado = false;
    
    while (C > 0 && itera < 10000)
        successors = sucesores(current);
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
            elseif(taboo_list(perm(1),perm(2)) == 0)
                current = new;
                currentC = cost;
                nuevo_estado = true;
            end
        end
        
        taboo_list = taboo_list-1;
        taboo_list(perm(1),perm(2)) = tenure;
        nuevo_estado = false;
        itera = itera+1;
    end
end 