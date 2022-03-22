function current = taboo(N)
    rng(0);
    % estado aleatorio
    current = randperm(N);
    best = current;
    itera = 0;
    taboo_list = zeros(N);
    tenure = N;
    C = inf;
    reina = 1;
    while (C > 0 && itera < 10000000 && reina <= N)
        successors = sucesores_taboo(current, reina);
        while(~isempty(successors))
            new = successors(1,:);
            perm = new(end-1:end);
            new = new(1:end-2);
            successors = successors(2:end,:);
            if(fEval(new) < fEval(best))
                current = new;
                best = current;
                C = fEval(best);
            elseif(taboo_list(perm(1),perm(2)) == 0 && taboo_list(perm(2),perm(1)) == 0)
                current = new;
                taboo_list(perm(1),perm(2)) = tenure;
            end
        itera = itera+1;
        end
        reina = reina +1;
        for i=1:1:length(taboo_list)
            for j=i+1:1:length(taboo_list)
                if(taboo_list(perm(1),perm(2)) ~= 0)
                    taboo_list(perm(1),perm(2)) = taboo_list(perm(1),perm(2))-1;
                end
            end
        end
    end
end 