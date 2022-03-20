function sucesor = RandomSuccessor(current)
    sucesor = current;
    i = randi(1, length(current));
    j = randi(1, length(current));

    while(i == j)
        i = randi(length(current));
        j = randi(length(current));
    end
    sucesor([i j]) = sucesor([j i]);
end