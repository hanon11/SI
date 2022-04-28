function V=sumaVelocidades(V1,V2)
% (1,2) + (2,3) = (1,3)
l1=size(V1,1);
l2=size(V2,1); % longitudes de ambas listas
i=1;
V=[];
while ((i<=l1) & (i<=l2))
    if(V1==0)
        V1(1,1)=0;
        V1(1,2)=0;
    end
    if(V2==0)
        V2(1,1)=0;
        V2(1,2)=0;
    end
    if V1(i,2)==V2(i,1)
        V(i,1)=V1(i,1);
        V(i,2)=V2(i,2);
    else
        V(i,:)=V1(i,:);
        %COMPLETAR
    end
    i=i+1;
end
% resto de elementos de cada lista se copian tal cual
if (i<=l1)
    V(i:l1,:)=V1(i:end,:);
else
    if (i<=l2)
        V(i:l2,:)=V2(i:end,:);
    end
end

end