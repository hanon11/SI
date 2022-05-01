clear all;
close all;
clc;

datos = zeros(3,1);
tStart = tic;   
for i=1:30
    [itera, sol, best] = pso(22,i)
    if sol == true
        datos(1,1) = datos(1,1)+1;
    end
    datos(2,1) = datos(2,1)+itera;
end
datos(2,1) = datos(2,1)/500;
datos(3,1) = toc(tStart)/500;
tStart = tic;  