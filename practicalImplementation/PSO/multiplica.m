function Vnew=multiplica(r,V)
N=size(V,1);
Vnew=[];
indices=[];
if N>0
    % generamos aleatorios por cada intercambio en V
    % escogemos los que superen el valor r
    aleatorio=rand(1,N);
    indices=find(aleatorio>r);
    if ~isempty(indices)
        Vnew=V(indices,:);  % elegimos
    end
end
end