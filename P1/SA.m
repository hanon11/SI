function current = SA(N)
    T = N*1000; T_min = 1;
    rand('seed', 0);
    % estado aleatorio
    current = randperm(N);
    itera=0;
    C = inf;
    while (T > T_min && C ~= 0 && itera < 10000)
        new = RandomSuccessor(current);
        deltaE = fEval(new) - fEval(current);
        if(deltaE < 0)
            current = new;
        else
            p = exp(-deltaE/T);
            if (p > rand(1))
                current = new;
            end
        end
        %enfriar
        T = (1000*N)/(1*itera);
        itera = itera+1;
    end
    itera

end
