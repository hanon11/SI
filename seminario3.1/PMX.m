function [son1, son2] = PMX(parent1, parent2)
son1 = zeros(1, length(parent1));
son2 = zeros(1, length(parent1));
copia = randi(length(parent1)-2);
copia2 = randi(length(parent1)-2);
while (copia == copia2)
    copia2 = randi(length(parent1)-1);
end
if copia > copia2
    aux = copia2;
    copia2 = copia;
    copia = aux;
end
copia = copia+1; copia2=copia2+1;
son1(copia+1:copia2)=parent2(copia+1:copia2);
indice = 1;
i = 1;
while ~isempty(find(son1 == 0, 1)) && i <= length(parent1)
    if isempty(find(son1 == parent1(i), 1)) && son1(i) == 0
        son1(i) = parent1(i);
        indice = indice+1;
        i = i+1;
    else
        i = i+1;
    end
end
son2(copia+1:copia2)=parent1(copia+1:copia2);
indice = 1;
i = 1;
while ~isempty(find(son2 == 0, 1)) && i <= length(parent1)
    if isempty(find(son2 == parent2(i), 1)) && son2(i) == 0
        son2(i) = parent2(i);
        indice = indice+1;
        i = i+1;
    else
        i = i+1;
    end
end

%ahora las colisiones
while ~isempty(find(son1 == 0, 1)) %no pudo colocar algo
    indices = find(son1 == 0); %indices del hijo con valor 0
    actual = 1;
    i = indices(actual);
    nuevo_valor = parent1(i);
    while ~isempty(find(son1 == nuevo_valor, 1))
        nueva_posicion = find(son1 == nuevo_valor);
        nuevo_valor = parent1(nueva_posicion);
    end
    son1(i) = nuevo_valor;
end
while ~isempty(find(son2 == 0, 1)) %no pudo colocar algo
    indices = find(son2 == 0); %indices del hijo con valor 0
    actual = 1;
    i = indices(actual);
    nuevo_valor = parent2(i);
    while ~isempty(find(son2 == nuevo_valor, 1))
        nueva_posicion = find(son2 == nuevo_valor);
        nuevo_valor = parent2(nueva_posicion);
    end
    son2(i) = nuevo_valor;
end
end
