function [Pob,FitPob] = AG_Satels(NSatels, NManagers, NPob, MAX_itera)

    matPos = randi(501,2,NSatels) - 1; 
    distancias = dist(matPos); 
    k = NPob/2;
    % Poblacion inicial
    Pob = GeneraPoblacion_Satels(NSatels,NManagers,NPob);
    FitPob = EvaluaPoblacion_Satels(Pob,distancias);
    itera = 1;
    Pmut = 0.1;
    mejora = 1;
    fitmej = -inf;
    MAX_mejor = 30;
    while itera <= MAX_itera && mejora<=MAX_mejor %(para si no mejora en 10 generaciones)
        Padres = Selection_Roulette(FitPob,k); % Devuelve los indices de los padres que se cruzaran usando k = 5
        parejas = Emparejar_Satels(Padres,NPob);
        newPob = Cruzar_Satels(parejas,Pob,NManagers); % Devuelve nueva poblacion cruzada
        newPobMutada = Mutar_Satels(newPob,Pmut); % Poblacion con mutaciones
        FitMutada = EvaluaPoblacion_Satels(newPobMutada,distancias);
        [Pob,FitPob] = ElitistReplace(Pob,newPobMutada,FitPob,FitMutada);
        itera = itera + 1;
        if max(FitPob) > fitmej
            fitmej = max(FitPob);
            mejora = 1;
        else
            mejora = mejora + 1;
        end
    end
    
end

