function [result,menor] = distancia_euclidea(M, V)
    result = inf;
    [~, n_col] = size(M); % numero de filas y columnas de la matriz
    for col = 1:n_col % recorro columnas
        sumatorio = sum((M(:,col) - V).^2); % sumatorio de distancias euclidea
        sumatorio = sqrt(sumatorio);
        if(result > sumatorio) % si la distancia de la columna es menor que lo que llevo hasta ahora
                menor = M(:,col);
                result = sumatorio;
        end
    end
end