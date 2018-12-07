function euclideaGlobal = fEval(vecRep, dist)
%vecRep: vector booleano 1xN donde N = n? Satelites, 
%y si vecRep(i) == true, entonces el satelite i es representante.
%
%dist: matriz de distancias entre satelites 2xN
    euclideaGlobal = 0;
    representados = (find(~vecRep));
    for i=1:representados
        distancias = dist(i, vecRep);
        euclideaGlobal = euclideaGlobal + min(distancias);    
    end                 
end
