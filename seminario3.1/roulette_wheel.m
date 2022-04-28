function seleccion = roulette_wheel(poblacion,n)
    seleccion = [];
    table = cumsum(poblacion ./ sum(poblacion));

    for i=1:1:n
        seleccion = [seleccion; poblacion(find(table >= rand(),1),:)];
    end
end