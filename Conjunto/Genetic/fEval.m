function euclideaGlobal = fEval(vecRep, matPos)
%vecRep: vector booleano 1xN donde N = nº Satelites, 
%y si vecRep(i) == true, entonces el satelite i es representante.
%
%matPos: matriz de posiciones de los satelites 2xN

    euclideaGlobal = 0;
    
    for i=1:length(vecRep)
        if ~vecRep(i) %Por cada representado
            distancias = d_euclid(matPos(:,vecRep), matPos(:,i));
            euclideaGlobal = euclideaGlobal + min(distancias);
        end                
    end 
end