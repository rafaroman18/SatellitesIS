function [lista_sucesores, posChanged] = sucesores(original, matPos)

cont  = 1;
lista_sucesores = zeros(length(original), length(original)+1 );

    for i = original
    
        sucesor = [original(1:cont-1) ~original(cont) original(cont+1:end)];
        sucesor
        -fEval(sucesor, matPos)
        
        lista_sucesores(cont, :) = [sucesor -fEval(sucesor, matPos)];
        cont = cont+1;
        
    end

    [lista_sucesores , posChanged] = sortrows(lista_sucesores, size(lista_sucesores,2));
    lista_sucesores = lista_sucesores(:,1:end-1);
    
end