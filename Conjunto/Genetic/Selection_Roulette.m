%%% Seleccion por Ruleta %%%

function [Padres] = Selection_Roulette(FitPob,k)
    Padres = zeros(1,k);
    PUnit = 1 / sum(FitPob);
    PrbAcum = cumsum(PUnit * FitPob);    
    i = 1;
    while i <= k
        r = rand;
        j = find(r<=Prob,1,'last');
        c = ismember(j-1,Padres);
        if c == 0
            Padres(i) = j - 1;
            i = i + 1;
        end
    end
end
