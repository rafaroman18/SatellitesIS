function s = sucesores(original,distancias)

tempS = zeros(10, length(original)+1);

for i = 1: 10
    tempS(i,1:end-1) = sucesor(original);
    tempS(i,length(original)+1) = fEval(tempS(i,1:end-1), distancias);
end

    s = unique(tempS,'rows');
    s = sortrows(s,length(original)+1);
    s = s(:,1:end-1);
end