function e=EvaluaPoblacion(V)
    for i=1:length(V)
        e(i,:)=EvaluaTablero(V(i,:));
    end  
end