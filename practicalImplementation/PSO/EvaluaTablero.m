function r=EvaluaTablero(V)
    r=0;
    for i=1:length(V)-1
        for j=i+1:length(V)
             r=r+ (abs(V(i)-V(j))==abs(i-j))+(V(i)==V(j));
        end
    end
    r=-1*r;  
    maxAtaques=sum(1:length(V)-1);
    r=maxAtaques+r;
end