function [son1, son2] = point1(parent1, parent2)
    copia = randi(length(parent1));
    son1(copia+1:length(parent1))=parent1(copia+1:length(parent1));
    son2(copia+1:length(parent2))=parent2(copia+1:length(parent2));
    son1(1:copia)=parent2(1:copia);
    son2(1:copia)=parent1(1:copia);
end