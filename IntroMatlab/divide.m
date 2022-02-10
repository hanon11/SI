function [A,B] = divide(M, Porcentaje)
    [~, n_col] = size(M); % numero de filas y columnas de la matriz
    A = M(:,1:Porcentaje/10);
    B = M(:,Porcentaje/10+1:n_col);
end