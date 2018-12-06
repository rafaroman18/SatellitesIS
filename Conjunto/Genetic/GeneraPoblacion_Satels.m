function [Pob] = GeneraPoblacion_Satels(NSatels,NManagers,NPob)
    Pob = zeros(NPob,NSatels);
    i = 1;
    while i <= NPob
        r = randperm(NSatels);
        Pob(i,r(1:NManagers)) = 1;
        Pob = logical(Pob);
        i = i + 1;
    end
end