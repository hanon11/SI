function [A,B] = divide(M, Porcentaje)
    [~, n_col] = size(M); % numero de filas y columnas de la matriz
    A = M(:,1:Porcentaje/10);
    B = M(:,Porcentaje/10+1:n_col);
    plot(A(1,:), A(2,:), 'o', 'MarkerEdgeColor', 'red')
    hold on
    plot(B(1,:), B(2,:), '*', 'MarkerEdgeColor', 'green')
    hold off
    legend('Puntos de A','Puntos de B')
end