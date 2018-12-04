function mutado = insertion(original)

    puntos = randperm(length(original));
    if (puntos(1) < puntos(2))
        punto1 = puntos(1);
        punto2 = puntos(2);
    else
        punto1 = puntos(2);
        punto2 = puntos(1);
    end
    clear puntos;
    
    mutado = [original(1:punto1-1) original(punto1+1:punto2-1) original(punto1) original(punto2:end)];

end