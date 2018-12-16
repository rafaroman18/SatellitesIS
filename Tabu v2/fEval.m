function euclideaGlobal = fEval(vecRep, dist)
%vecRep: vector booleano 1xN donde N = n? Satelites, 
%y si vecRep(i) == true, entonces el satelite i es representante.
%
%dist: matriz de distancias entre satelites 2xN
    vecRep = logical(vecRep);
    euclideaGlobal = 0;
    representados = (find(~vecRep));
    
    for i=1:length(representados)
        distancias = dist(representados(i), vecRep);
        euclideaGlobal = euclideaGlobal + min(distancias);    
    end                 
end
