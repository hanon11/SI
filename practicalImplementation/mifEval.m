function coste = mifEval(v)
%C=[1 14 13 12 7 6 15 5 11 9 10 19 20 21 16 3 2 17 22 4 18 8]
coste = 0;
load("tsp.mat")
N=length(v);
for i=1:2:N
    X1=Nodes(i,2:3)';
    X2=Nodes(i+1,2:3)';
    D = norm(X2-X1);
    coste = coste+D;
end
X1=Nodes(1,2:3)';
X2=Nodes(N,2:3)';
D = norm(X2-X1);
coste = coste+D;
coste=abs(coste);
end