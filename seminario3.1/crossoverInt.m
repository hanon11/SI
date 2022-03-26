function [son1, son2] = crossoverInt(parent1, parent2)
    copia = randi(length(parent1));
    son1(copia+1:length(parent1))=parent1(copia+1:length(parent1));
    son2(copia+1:length(parent2))=parent2(copia+1:length(parent2));
    indice = 1;
    i = 1;
    while ~isempty(find(son1 == 0, 1)) && i <= length(parent1)
        if isempty(find(son1 == parent2(i), 1))
            son1(indice) = parent2(i);
            indice = indice+1;
            i = i+1;
        else
            if i == length(parent1)
                i = 1;
            else 
                i = i+1;
            end
        end
    end

    indice = 1;
    i = 1;
    while ~isempty(find(son2 == 0, 1)) && i <= length(parent1)
        if isempty(find(son2 == parent1(i), 1))
            son2(indice) = parent1(i);
            indice = indice+1;
            i = i+1;
        else
            if i == length(parent1)
                i = 1;
            else 
                i = i+1;
            end
        end
    end
end