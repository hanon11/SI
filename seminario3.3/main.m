function [itera, sol] = main(NReinas)
NQ = NReinas; %Numero de Reinas
NPob = NQ+5; %Numero de Tableros/Individuos de la poblacion
MAX_itera = 100;
Pcross = 0.9;
Pmut = 0.1;
Pob = GenPob(NQ, NPob);
Fitness = Pob(:, end);
Pob = Pob(:, 1:end-1);
itera = 1;
while itera <= MAX_itera && sum(Fitness) > 0 
    Elegidos = roulette_wheel(Pob,NQ);
    tam = length(Elegidos);
    alto = height(Elegidos);
    tempPob = zeros(alto, tam);
    for i=1:2:height(Elegidos)
        [p1,p2] = PMX(Elegidos(i,1:end), Elegidos(i+1,1:end));
        tempPob(i,:) = p1;
        tempPob(i+1,:) = p2;
    end
   
    Fitness = zeros(height(tempPob), 1);
    for i=1:height(tempPob)
        Fitness(i) = fEval(tempPob(i,:));
    end
    Pob = tempPob;
    itera = itera+1;
end
if itera > MAX_itera
    sol = false;
else 
    sol = true;
end
end
