function s = miSigmoide(V, lambda)
s = 1./(1+exp(-lambda*V));

end