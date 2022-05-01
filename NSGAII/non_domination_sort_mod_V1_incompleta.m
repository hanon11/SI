function f = non_domination_sort_mod_V1_incompleta(x, M, V)
%% function f = non_domination_sort_mod(x, M, V)
% This function sort the current popultion based on non-domination. All the
% individuals in the first front are given a rank of 1, the second front
% individuals are assigned rank 2 and so on. After assigning the rank the
% crowding in each front is calculated.

N = size(x,1);
% Initialize the front number to 1.
front = 1;
% There is nothing to this assignment, used only to manipulate easily in
% MATLAB.
F(front).f = [];
individual = [];

%% Non-Dominated sort. 
% The initialized population is sorted based on non-domination. The fast
% sort algorithm [1] is described as below for each

% • for each individual p in main population P do the following
%   – Initialize Sp = []. This set would contain all the individuals that is
%     being dominated by p.
%   – Initialize np = 0. This would be the number of individuals that domi-
%     nate p.
%   – for each individual q in P
%       * if p dominates q then
%           · add q to the set Sp i.e. Sp = Sp ? {q}
%       * else if q dominates p then
%           · increment the domination counter for p i.e. np = np + 1
%   – if np = 0 i.e. no individuals dominate p then p belongs to the first
%     front; Set rank of individual p to one i.e prank = 1. Update the first
%     front set by adding p to front one i.e F1 = F1 ? {p}
% • This is carried out for all the individuals in main population P.
% • Initialize the front counter to one. i = 1
% • following is carried out while the ith front is nonempty i.e. Fi != []
%   – Q = []. The set for storing the individuals for (i + 1)th front.
%   – for each individual p in front Fi
%       * for each individual q in Sp (Sp is the set of individuals
%         dominated by p)
%           · nq = nq?1, decrement the domination count for individual q.
%           · if nq = 0 then none of the individuals in the subsequent
%             fronts would dominate q. Hence set qrank = i + 1. Update
%             the set Q with individual q i.e. Q = Q ? q.
%   – Increment the front counter by one.
%   – Now the set Q is the next front and hence Fi = Q.
%
% This algorithm is better than the original NSGA ([2]) since it utilize
% the informatoion about the set that an individual dominate (Sp) and
% number of individuals that dominate the individual (np).

%
for i = 1 : N   %% cada individuo 
    % Number of individuals that dominate this individual
    individual(i).n = 0;  %%Nº DOMINANTES de i
    % Individuals which this individual dominate LISTA DOMINADOS
    individual(i).p = [];

    dominados=x(i,V + 1:V+M) <= x(:,V+1:V+M);
    dominantes=x(i,V + 1:V+M) >= x(:,V+1:V+M);
    %%%%  1. FALTA INSTRUCCIÓN
    %%%%********************************
    dominados(i,:) = [0 0]; 
    dominantes(i,:) = [0 0]; 
    %%para i dominar a otro debe ser menor en alguna componente y menor o igual en el resto, 
    dominados=sum(dominados')';
    p=find(dominados==M);
    %% por tanto los que son iguales en todas las componentes no son
    %% dominados ni dominantes
    %%%  2. FALTA INSTRUCCIÓN ****************************************
    indices = x(i,V + 1:V+M) == x(:,V+1:V+M);
    indices(i,:) = [0 0];
    %%%  3. FALTA INSTRUCCIÓN ****************************************
    indiceAeliminar = sum(indices')';
    indiceAeliminar = find(indiceAeliminar==M);
    if indiceAeliminar
        pos = find(p == indiceAeliminar(1));
        p(pos) = [];
    end
    %% p=setdiff(p,e)'; %% quita a todos los exactamente iguales en todas sus f
    if ~isempty(p)
            individual(i).p=p;  %% lista de dominados por i
    end
    %% para j dominar a i, los costes de i tienen que ser mayores en alguna componente y mayor o igual en el resto
    dominantes=sum(dominantes')';
    %% De nuevo hay que eliminar a los exactamente iguales en todas las componentes
    %%%% 4. FALTA INSTRUCCIÓN *************************************************************
    if indiceAeliminar
        dominantes(indiceAeliminar) = 0;
    end
    individual(i).n=length(find(dominantes==2));  %% lista de dominados por i
    
    %% Si no hay ningún candidato que domine a i, i se añade al Frente
    if individual(i).n == 0
        x(i,M + V + 1) = 1;
        F(front).f = [F(front).f i];
    end
end

%% REVISAR PARA SU OPTIMIZACIÓN
% Find the subsequent fronts
while ~isempty(F(front).f)
   Q = [];
   for i = 1 : length(F(front).f)
       if ~isempty(individual(F(front).f(i)).p)
        	for j = 1 : length(individual(F(front).f(i)).p)
            	individual(individual(F(front).f(i)).p(j)).n = ...
                	individual(individual(F(front).f(i)).p(j)).n - 1;
        	   	if individual(individual(F(front).f(i)).p(j)).n == 0
               		x(individual(F(front).f(i)).p(j),M + V + 1) = ...
                        front + 1;
                    Q = [Q individual(F(front).f(i)).p(j)];
                end
            end
       end
   end
   front =  front + 1;
   F(front).f = Q;
end

[temp,indices] = sort(x(:,M + V + 1));
sorted_based_on_front=x(indices,:);  %% ORDENA Según el Frente 
curr = 0;

%% Crowding distance (DISTANCIA DE HACINAMIENTO)
% Find the crowding distance for each individual in each front
for front = 1 : (length(F) - 1)
    prev = curr + 1;
    indices=find(sorted_based_on_front(:,V+M+1)==front);
    y=sorted_based_on_front(indices,:);
    curr = curr + length(indices);
    for i = 1 : M
        [valores,indices]=sort(y(:,V+i));
        sorted_based_on_objective=y(indices,:);
        fmax=sorted_based_on_objective(end,V+i); %%el mayor
        fmin=sorted_based_on_objective(1,V+i); %%el menor
        y(:,M+V+1+i)=Inf;

         for j=2 : length(indices)-1
             next_obj = sorted_based_on_objective(j+1,V+i);
             prev_obj = sorted_based_on_objective(j-1,V+i);
            if (fmax - fmin == 0)
                y(indices(j),M + V + 1 + i) = Inf;
            else
                y(indices(j),M + V + 1 + i) = ...
                     (next_obj - prev_obj)/(fmax - fmin);
            end
         end 
    end
    distance = sum(y(:,end-M+1:end),2);
    z(prev:curr,:)=[y(:,1:V+M+1),distance];
end
f = z();
