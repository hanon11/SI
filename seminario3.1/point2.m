function [son1, son2] = point2(parent1, parent2)
copia = randi(length(parent1));
copia2 = randi(length(parent1));
while (copia == copia2)
    copia2 = randi(length(parent1));
end
if copia < copia2
    son1(1:copia)=parent2(1:copia);
    son2(1:copia)=parent1(1:copia);
    son2(copia+1:copia2)=parent2(copia+1:copia2);
    son1(copia+1:copia2)=parent1(copia+1:copia2);
    son1(copia2+1:length(parent1))=parent2(copia2+1:length(parent1));
    son2(copia2+1:length(parent1))=parent1(copia2+1:length(parent1)); 
else
    son1(1:copia2)=parent2(1:copia2);
    son2(1:copia2)=parent1(1:copia2);
    son2(copia2+1:copia)=parent2(copia2+1:copia);
    son1(copia2+1:copia)=parent1(copia2+1:copia);
    son1(copia+1:length(parent1))=parent2(copia+1:length(parent1));
    son2(copia+1:length(parent1))=parent1(copia+1:length(parent1)); 
end
end