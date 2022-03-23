function [S, minimo] = BestSuccessor(x,v)
    %x is	a	complete	assignment 
    % v is	 the	 queen	 to	 consider	 in	 order	 to	 generate	 new	successors only	 by	 exchanging	
    %values	of	this	queen	with	the	rest	of	queens   
    % S the	best	successor (the	evaluation	of	this state	can	be	also	returned	in	this	variable)
    S = x;
    minimo = inf;
    for i=1:1:length(x)
        if(i ~= v)
            x([v i]) = x([i v]);
            valor_evaluacion = fEval(x);
            if(minimo >= valor_evaluacion)
                minimo = valor_evaluacion;
                S = x;
            end
        end
    end
end