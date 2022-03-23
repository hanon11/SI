function [C, itera] = localSearch(N)
    %N = nReinas
    % X=	final	assignment	and	C=Overall	Cost
    %	1.	Initializations
    X = randperm(N);
%	2.	Search	loop
    itera=0;
    C = inf;
    best = X;
    itera_sin_mejora = 0;
    while (C ~= 0 && itera < 200*N && itera_sin_mejora < 10+N)
			currentVar = mod(itera,N)+1; %%	Next	variable,	in	each	iteration	a	different	variable
			[X, coste] = BestSuccessor(best,currentVar);		 %%	Best	Successor
            if(C > coste)
                best = X;
                C = coste;
                itera_sin_mejora = 0;
            end
			 %Updates
            itera = itera+1;
            itera_sin_mejora = itera_sin_mejora+1;
    end
end
