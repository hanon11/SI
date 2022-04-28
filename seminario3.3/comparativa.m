clear all;
close all;
clc;

datos = zeros(3,2);
tStart = tic;   
for i=1:500
    [itera, sol] = main(40);
    if sol == true
        datos(1,1) = datos(1,1)+1;
    end
    datos(2,1) = datos(2,1)+itera;
end
datos(2,1) = datos(2,1)/500;
datos(3,1) = toc(tStart)/500;
tStart = tic;  
for i=1:500
    [itera, sol] = main(100);
    if sol == true
        datos(1,2) = datos(1,2)+1;
    end
    datos(2,2) = datos(2,2)+itera;
end
datos(2,2) = datos(2,2)/500;
datos(3,2) = toc(tStart)/500;