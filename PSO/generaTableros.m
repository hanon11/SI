function poblacion=generaTableros(NReinas, NTableros)
    poblacion = zeros(NTableros, NReinas);
    for i=1:NTableros
        poblacion(i,:)=randperm(NReinas); 
    end
end