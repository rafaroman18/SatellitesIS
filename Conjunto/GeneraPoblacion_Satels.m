function [Pob] = GeneraPoblacion_Satels(NSatels,NManagers,NPoblacion)
    Pob = zeros(NPoblacion,NSatels);
    i = 1;
    while i <= NPoblacion
        r = randperm(NSatels);
        Pob = zeros(1,NSatels);
        Pob(i,r(1:NManagers)) = 1;
        Pob = logical(Pob);
        i = i + 1;
    end
end