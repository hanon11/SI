function [current, C, itera] = SA(N,cota, semilla ,T_max, T_min)
    %T_max = 1000; 
    %T_min = 0;
    rng(semilla);
    Nodes = importdata('tsp.mat');
    T = T_max;
    % estado aleatorio
    current = randperm(N);
    itera = 0;
    C = inf;
    cont = 0;
    while (T > T_min && C > cota && itera < 1000*N && cont < N-1)
        new = RandomSuccessor(current);
        deltaE = fEval(new, Nodes) - fEval(current,Nodes);
        if(deltaE < 0)
            current = new;
            C = fEval(new,Nodes);
            cont = 0;
        else
            p = exp(-deltaE/T);
            cont = cont+1;
            if (p > rand(1))
                current = new;
                cont=0;
                C = fEval(new,Nodes);
            end
        end
        %enfriar
        T = T_max/(1+itera);
        itera = itera+1;
    end
end
