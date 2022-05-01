function e=EvaluaPoblacion(V,Nodes)
    for i=1:length(V)
        e(i,:)=fEval(V(i,:),Nodes);
    end  
end