function current = SA(N)
    T_max = 1000; T_min = 1;
    T = T_max;
    rand('seed', 0);
    % estado aleatorio
    current = randperm(N);
    itera = 0;
    C = inf;
    while (T > T_min && C ~= 0 && itera < 10000)
        new = RandomSuccessor(current);
        deltaE = fEval(new) - fEval(current);
        if(deltaE < 0)
            current = new;
            C = fEval(new);
        else
            p = exp(-deltaE/T);
            if (p > rand(1))
                current = new;
                C = fEval(new);
            end
        end
        %enfriar
        T = T_max/(1*itera);
        itera = itera+1;
    end
end
