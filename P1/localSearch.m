function [X,C] = localSearch(N)
    %N = nReinas
    % X=	final	assignment	and	C=Overall	Cost
    %	1.	Initializations
    X = randperm(N);
%	2.	Search	loop
    itera=0;
    C = inf;
    while (C ~= 0 && itera < 100)
			currentVar = mod(itera,N)+1; %%	Next	variable,	in	each	iteration	a	different	variable
			[X, C] = BestSuccessor(X,currentVar);		 %%	Best	Successor
			 %Updates
            itera = itera+1;
    end
    x = 1:N;
    plot(x, X, 'o');
    X
    C
end