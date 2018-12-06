function [parejas] = Emparejar_Satels(Padres,NPob)
    parejas = zeros(2,length(Padres));
    i = 1;
    while i <= NPob/2
        p1 = randi(length(Padres));
        p2 = randi(length(Padres));
        r = rep(p1,p2,parejas);
        if p1 ~= p2 && r == 0
            parejas(1,i) = p1;
            parejas(2,i) = p2;
            i = i + 1;
        end
    end
end


function [b] = rep(p1,p2,parejas)
    b = 0;
    f = find(parejas(1,:) == p1);
    for i=1:length(f)
        if parejas(2,f(i)) == p2
            b = 1;
        end
    end
end