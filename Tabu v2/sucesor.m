function s = sucesor(original)

    findCeros = find(original == 0);
    findUnos  = find(original == 1);

    rCero = randperm(length(findCeros));
    rUno  = randperm(length(findUnos));
    
    indCero = rCero(1);
    indUno  = rUno(1);
    
    original([findCeros(indCero) findUnos(indUno)]) = original([findUnos(indUno) findCeros(indCero)]);
    s = original;

end