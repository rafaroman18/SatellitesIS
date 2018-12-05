function [newPobMutada] = MutarPoblacion_Satels(newPob,Pmut)
    newPobMutada = zeros(size(newPob,1),size(newPob,2));
    i = 1;
    while i <= size(newPob,1)
    if rand<=Pmut
       newPobMutada(i,:) = inversion(newPob(i,:));
       end
    end
end
