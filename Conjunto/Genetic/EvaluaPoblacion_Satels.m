function [FitPob] = EvaluaPoblacion_Satels(Pob,dist)
    FitPob = zeros(1,size(Pob,1));
    
    for i = 1:size(Pob,1)
        FitPob(1,i) = -fEval(Pob(i,:),dist);
    end
end
