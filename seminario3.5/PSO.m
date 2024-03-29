w = 0.8;
cp = 0.7;
cg = 0.8;

S0 = [11 16; 2 17; 14 6; 1 18];
pbest = S0;
V0 = zeros(length(S0),2);
fitness = zeros(length(S0),1);
for i=1:length(S0)
    fitness(i) = PsoEval(S0(i,:));
end
[~,gb] = min(fitness);
%itera 1
S1 = zeros(height(S0),2);
V1 = zeros(height(S0),2);
rg = [0.0618; 0.3699; 0.1137; 0.1850];
for i=1:length(S0)
    V1(i,:) = w*V0(i,:) + cp*rg(i)*(pbest(i,:)- S0(i,:)) + cg*rg(i)*(S0(gb,:)- S0(i,:));
    S1(i,:) = S0(i,:)+V1(i,:);
end

for i=1:length(S0)
    if PsoEval(S1(i,:)) < PsoEval(S0(i,:))
        pbest(i,:) = S1(i, :);
    else
        pbest(i,:) = S0(i, :);
    end
    
end

[~,gb] = min(fitness);
rg =[0.9064; 0.5916; 0.8090; 0.3017];
rp = [0.9690 0.7012 0.9059 0.9473];
S2 = zeros(height(S0),2);
V2 = zeros(height(S0),2);
for i=1:length(S0)
    V2(i,:) = w*V1(i,:) + cp*rp(i)*(pbest(i,:)- S1(i,:)) + cg*rg(i)*(S1(gb,:)- S1(i,:));
    S2(i,:) = S1(i,:)+V2(i,:);
end
