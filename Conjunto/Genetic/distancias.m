function dist = distancias(matPos)
dist = zeros(length(matPos));
M = length(matPos);

for i = 1:M-1
    for j = i+1:M
        dist(i,j) = d_euclid(matPos(:,i),matPos(:,j));
    end
end

end


