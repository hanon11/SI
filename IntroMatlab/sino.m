function s=sino(m)
% s=sino(n) – Devuelve 1 si los elementos de la primera y segunda fila de m son iguales y 0 si no son iguales.
% ejemplo:
% m = [ 2 4 6 8 10; 2 5 6 8 11]
% s=sino(m)
 s=m(1,:)==m(2,:); %% == operador de igualdad
end