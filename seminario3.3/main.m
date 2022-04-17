NQ = 12; %Numero de Reinas
NPob = 12; %Numero de Tableros/Individuos de la poblacion
MAX_itera = 10000;
Pcross = 0.9;
Pmut = 0.1;
Pob = GenPob(NQ, NPob);
Fitness = Pob(:, end);
Pob = Pob(:, 1:end-1);
itera = 1;
while itera <= MAX_itera && sum(Fitness) > 0 
    Elegidos = tournament_select(Pob, 3, Fitness);
    tam = length(Elegidos);
    alto = height(Elegidos);
    tempPob = zeros(alto, tam-1);
    i=1;
    while i < height(Elegidos)/2
        [p1,p2] = PMX(Elegidos(i,1:end-1), Elegidos(i+1,1:end-1));
        tempPob(i,:) = p1;
        tempPob(i+1,:) = p2;
        i = i+2;
    end
    NewPob = mutation(tempPob);
    Fitness = zeros(height(NewPob), 1);
    for i=1:NPob
        Fitness(i) = fEval(NewPob(i));
    end
    itera = itera+1;
end

