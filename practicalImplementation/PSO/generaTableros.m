function poblacion=generaTableros(NReinas, NTableros, semilla)
    rng(semilla);
    poblacion = zeros(NTableros, NReinas);
    for i=1:NTableros
        poblacion(i,:)=randperm(NReinas); 
    end
end