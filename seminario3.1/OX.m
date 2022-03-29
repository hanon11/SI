function [son1, son2] = OX(parent1, parent2)
son1 = zeros(1, length(parent1));
son2 = zeros(1, length(parent1));
copia = randi(length(parent1)-1);
copia2 = randi(length(parent1)-1);
while (copia == copia2)
    copia2 = randi(length(parent1)-1);
end
if copia > copia2
    aux = copia2;
    copia2 = copia;
    copia = aux;
end
copia = copia+1; copia2=copia2+1;
%posiciones centrales:
son1(copia+1:copia2)=parent2(copia+1:copia2);
son2(copia+1:copia2)=parent1(copia+1:copia2);

if copia2 == length(parent1)
    indice = 1;
    i = 1;
else
    indice = copia2+1;
    i = copia2+1;
end
while ~isempty(find(son1 == 0, 1))
    if i == length(parent1)+1
        i = 1;
    end
    if isempty(find(son1 == parent1(i), 1)) && son1(indice) == 0
        son1(indice) = parent1(i);
        indice = indice+1;
        if indice == length(parent1)+1
            indice = 1;
        end
        i = i+1;
    elseif i == length(parent1)
        i = 1;
    else
        i = i+1;
    end
end
if copia2 == length(parent1)
    indice = 1;
    i = 1;
else
    indice = copia2+1;
    i = copia2+1;
end
while ~isempty(find(son2 == 0, 1))
    if i == length(parent1)+1
        i = 1;
    end
    if isempty(find(son2 == parent2(i), 1)) && son2(indice) == 0
        son2(indice) = parent2(i);
        indice = indice+1;
        if indice == length(parent1)+1
            indice = 1;
        end
        i = i+1;
    elseif i == length(parent1)
        i = 1;
    else
        i = i+1;
    end
end
end
