NQ = 12; %%Numero de Reinas
NPob = 12; %%Numero de Tableros/Individuos de la poblacion
MAX_itera = 10000;
Pcross = 0.9;
Pmut = 0.1;
Pob = GenPob(NQ, NPob);
Fitness = Pob(:, end);
Pob = Pob(:, 1:end-1);
itera = 1;
while itera <= MAX_itera %%AÑADIR: condiciones de parada>
    Elegidos = SELECCION(Pob);
    tempPob = CRUCE(Elegidos,Pcross);
    NewPob = MUTACION(tempPob,Pmut);
    Pob = REEMPLAZO(Pob,newPob);
    itera = itera+1;
end