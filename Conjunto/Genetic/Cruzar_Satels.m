function [newPob] = Cruzar_Satels(parejas,Pob)
    newPob = zeros(size(Pob,1),size(Pob,2));
    i = 1;
    while i <= length(parejas)
        crs = MaskCrossover(Pob(parejas(1,i),:),Pob(parejas(2,i),:));
        newPob(i,:) = crs(1,:);
        newPob(i+1,:) = crs(2,:);
        i = i + 2;
    end
end