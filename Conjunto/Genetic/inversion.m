function mutado = inversion(original)
%original: vector que queremos mutar
puntos = randperm(length(original));
if puntos(1) > puntos(2)
    p1 = puntos(2);
    p2 = puntos(1);
else
    p1 = puntos(1);
    p2 = puntos(2);
end
clear puntos;

mutado = original;
mutado(:, p1:p2 )  = flip(mutado(:, p1:p2));
end