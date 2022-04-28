rng(0);
costeMax=100;
valores = zeros(50,3);
for i=1:4
    [best, C, itera] = SA(22, costeMax);
    valores(i,1) = costeMax;
    valores(i,2) = C;
    valores(i,3) = itera;
    costeMax=costeMax-i*10;
end
