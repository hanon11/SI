rng(0);

%Nodes = importdata('tsp.mat');
costeMax=100;
valores = zeros(50,3);
for i=1:50
    [best, C, itera] = taboo(costeMax);
    valores(i,1) = costeMax;
    valores(i,2) = C;
    valores(i,3) = itera;
    costeMax=costeMax-i;
end
