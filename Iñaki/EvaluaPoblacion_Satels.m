function [FitPob] = EvaluaPoblacion_Satels(Pob, matPos)
    FitPob = zeros(1,size(Pob,1));
    
    for i = 1:size(Pob,1)
        FitPob(1,i) = -fEval(Pob(i,:), matPos);
    end
end
