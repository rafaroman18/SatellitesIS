function [Pob,FitPob] = AG_Satels
    NSatels = 500;
    NManagers = 40;
    NPob = 10; % Numero de individuos de la poblacion
    MAX_itera = 1000;
    matPos = randi(501,2,NSatels) - 1; 
    dist = distancias(matPos); 
    k = 5;
    % Poblacion inicial
    Pob = GeneraPoblacion_Satels(NSatels,NManagers,NPob);
    FitPob = EvaluaPoblacion_Satels(Pob,dist);
    itera = 1;
    Pmut = 0.1;
    
    while itera <= MAX_itera
        Padres = Selection_Roulette(FitPob,k); % Devuelve los indices de los padres que se cruzaran usando k = 5
        parejas = Emparejar_Satels(Padres,NPob);
        newPob = Cruzar_Satels(parejas,Pob,NManagers); % Devuelve nueva poblacion cruzada
        newPobMutada = Mutar_Satels(newPob,Pmut); % Poblacion con mutaciones
        FitMutada = EvaluaPoblacion_Satels(newPobMutada,matPos);
        [Pob,FitPob] = ElitistReplace(Pob,newPobMutada,FitPob,FitMutada);
        itera = itera + 1;
    end
    
end

