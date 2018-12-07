function [newPobMutada] = Mutar_Satels(newPob,Pmut)
    newPobMutada = newPob;
    i = 1;
    while i <= size(newPob,1)
    if rand<=Pmut
       newPobMutada(i,:) = inversion(newPob(i,:));
    end
    i = i + 1;
    end
end
