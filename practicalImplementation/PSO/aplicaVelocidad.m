function t=aplicaVelocidad(S,V)
t=S;
if(~isempty(V))
    if(V~=0)
        t=S;
        t(V(1,2))=S(V(1,1));
        t(V(1,1))=S(V(1,2));
    else
        t=S;
    end
end
end