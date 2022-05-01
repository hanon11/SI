%{
    Genera la nueva población a partir de los mejores de la población
    inicial y sus descendientes
    
    -- Entrada
    pob         : Población inicial
    pobFit      : Función de evaluación para la población inicial
    newPob      : Descendientes de la población inicial
    newPobFit   : Función de evaluación para los descendientes
    
    -- Salida
    newPob      : Población resultante
    newPobFit   : Función de evaluación para la población resultante
%}

function [newPob, newPobFit] = elitista(pob, pobFit, newPob, newPobFit)
    totPob = [pob ; newPob];
    totPobFit = [pobFit ; newPobFit];
    
    % Ordenamos todos los elementos
    [~, inds] = sort(totPobFit);
    totPob = totPob(inds,:);
    totPobFit = totPobFit(inds,:);
    
    % Elegimos los mejores
    newPob = totPob(1:size(newPob,1),:);
    newPobFit = totPobFit(1:size(newPobFit,1),:);
end