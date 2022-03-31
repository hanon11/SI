function mutado = mutation(x)
    mutado = x;
    %swap 
    elem1 = randi(length(x));
    elem2 = randi(length(x));
    while elem1 == elem2
        elem2 = randi(length(x));
    end
    mutado(elem1) = x(elem2);
    mutado(elem2) = x(elem1);
end