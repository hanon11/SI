function [A,B] = divide(M, Porcentaje)
    [~, n_col] = size(M); % numero de filas y columnas de la matriz
    col = 1:(Porcentaje/10); % la matriz A se llena con los valores de M desde la col 1 hasta el porcentaje
    A(:,col) = M(:,col);
    col2 = Porcentaje/10+1:n_col; % la matriz B se llena con los valores de M 
                                  % desde la col Porcentaje +1 hasta el final
    colB = (col2-Porcentaje/10);
    B(:,colB) = M(:,col2);
end