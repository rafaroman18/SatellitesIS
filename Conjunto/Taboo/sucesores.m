function [lista_sucesores, posChanged] = sucesores(original, distancias)

lista_sucesores = repmat(original, length(original), 1);
diagonal = lista_sucesores(logical(eye(length(original))));
lista_sucesores(logical(eye(length(original)))) = original(1);
lista_sucesores(:,1) = diagonal;
lista_sucesores = double(unique(lista_sucesores,'rows'));

lista_sucesores(:,end+1) = EvaluaPoblacion_Satels(lista_sucesores, distancias);

[lista_sucesores , posChanged] = sortrows(lista_sucesores, size(lista_sucesores,2));
lista_sucesores = logical(lista_sucesores(:,1:end-1));
    
end