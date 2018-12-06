function [newPob] = Cruzar_Satels(parejas,Pob,NManagers)
    newPob = zeros(size(Pob,1),size(Pob,2));
    i = 1;
    k = 1;
    while i <= length(parejas)
        crs = MaskCrossover(Pob(parejas(1,i),:),Pob(parejas(2,i),:),NManagers);
        newPob(k,:) = crs(1,:);
        newPob(k+1,:) = crs(2,:);
        k = 2*i + 1;
        i = i + 1;
    end
end