function escogidos = escoge_k_tournament(poblacion, k)
    escogidos = zeros(1,k); %indices de los escogidos
    for i=1:k
        escogido = randi(k);
        escogidos(:,i) = escogido;
    end
end