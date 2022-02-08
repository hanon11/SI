function result = ecm(v1, v2)
result = 1/length(v1);
n = 1:length(v1);
sumatorio = sum(pow2(v1(n) - v2(n)));
result = result * sumatorio;
end 