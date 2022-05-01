function [current, C, itera] = SA(semilla)
    N=22;
    T_max = 1000; T_min = 0; T = T_max;
    rng(semilla);
    Nodes = importdata('tsp.mat'); %cargamos datos
    % estado aleatorio
    current = randperm(N);
    itera = 0;
    C = inf;
    cont = 0;
    while (T > T_min && C > 75 && itera < 1000*N && cont < 2*N-1)
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
