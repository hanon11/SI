%{
    Genera una nueva población a partir de los padres e hijos
    
    -- Entrada
    pob         : Padres
    pobFit      : Función de evaluación para los padres
    newPob      : Hijos
    newPobFit   : Función de evaluación para los hijos
    porc        : Valor entre 0 y 1 que representa el porcentaje de padres 
                  que se van a tomar como mínimo

    -- Salida
    finalPob    : Población elegida
    finalPobFit : Función de evaluación para la población elegida
%}

function [finalPob, finalPobFit] = generacional(pob, pobFit, newPob, newPobFit, porc)
    finalPob = zeros(size(pob,1),size(pob,2));
    finalPobFit = zeros(size(pob,1),1);

    % Ordenamos la población por la función de evaluación
    [~,indices] = sort(pobFit);
    pobFit = pobFit(indices,:);
    pob = pob(indices,:);

    % Ordenamos los desecendientes por la función de evaluación
    [~,indices] = sort(newPobFit);
    newPobFit = newPobFit(indices,:);
    newPob = newPob(indices,:);
    
    % Calculamos cuantos individuos se van a tomar de los padres
    indv = floor(porc * size(pob,1));

    finalPob(1:indv,:) = pob(1:indv,:);
    finalPobFit(1:indv,:) = pobFit(1:indv,:);

    % Tomamos el resto de los hijos
    resto = size(pob,1) - indv;

    % Si hay menos hijos que individuos nos faltan
    if resto > size(newPob,1)
        % Rellenamos con los padres
        finalPob(indv+1:indv+(resto - size(newPob,1)),:) = ... 
            pob(indv+1:indv+(resto - size(newPob,1)),:);
        finalPobFit(indv+1:indv+(resto - size(newPob,1)),:) = ...
            pobFit(indv+1:indv+(resto - size(newPob,1)),:);

        % Rellenamos con los hijos
        finalPob(end-size(newPob,1)+1:end,:) = newPob;
        finalPobFit(end-size(newPob,1)+1:end,:) = newPobFit;
    % Hay al menos tantos hijos como posiciones faltan
    else
        finalPob(indv+1:end,:) = newPob(1:resto,:);
        finalPobFit(indv+1:end,:) = newPobFit(1:resto,:);
    end
end