function euclideaGlobal = fEval(vecRep, dist)
%vecRep: vector booleano 1xN donde N = n? Satelites, 
%y si vecRep(i) == true, entonces el satelite i es representante.
%
%matPos: matriz de posiciones de los satelites 2xN
    euclideaGlobal = 0;
    ind = find(vecRep);
    for i=1:length(vecRep)
        if ~vecRep(i) %Por cada representado
            for x = 1:length(ind)
            D  = ;                          %%FALTA TERMINAR IMPLEMENTARLO%%
            euclideaGlobal = euclideaGlobal + D;
            D = 0;
            end
        end                
    end 
end
