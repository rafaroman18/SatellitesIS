%%% Seleccion por Ruleta %%%

function [Padres] = Selection_Roulette(FitPob,k)
    Padres = zeros(1,k);
    PUnit = 1 / sum(FitPob);
    PrbAcum = cumsum(PUnit * FitPob);    
    i = 1;
    while i <= k
        r = rand;
        j = find(r>=PrbAcum,1,'last');
        c = ismember(j,Padres);
        if c == 0
            Padres(i) = j;
            i = i + 1;
        end
    end
end