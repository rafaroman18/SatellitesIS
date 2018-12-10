function [FitPob] = EvaluaPoblacion_Satels(Pob,distancias)
    FitPob = zeros(1,size(Pob,1));
    
    for i = 1:size(Pob,1)
        FitPob(1,i) = -fEval(Pob(i,:),distancias);
    end
end