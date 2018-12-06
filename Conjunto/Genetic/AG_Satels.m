function [S,itera] = AG_Satels(NSatels,NManagers)
    NPob = 10; % Numero de individuos de la poblacion
    MAX_itera = 3000;
    rand('seed',5);
    matPos = randi(501,2,NSatels) - 1; 
    %dist = distancias(matPos); %Implementar y cambiar junto con fEval
    k = 5;
    % Poblacion inicial
    Pob = GeneraPoblacion_Satels(NSatels,NManagers,NPob);
    FitPob = EvaluaPoblacion_Satels(Pob,matPos);
    itera = 1;
    Pmut = 0.1;
    
    while itera <= MAX_itera
        Padres = Selection_Roulette(FitPob,k); % Devuelve los indices de los padres que se cruzaran usando k = 5
        parejas = Emparejar_Satels(Padres,NPob);
        newPob = Cruzar_Satels(parejas,Pob,NManagers); % Devuelve nueva poblacion cruzada
        newPobMutada = Mutar_Satels(newPob,Pmut); % Poblacion con mutaciones
        FitMutada = EvaluaPoblacion_Satels(newPobMutada,matPos);
        [Pob,FitPob] = Reemplazo_Satels(newPobMutada,FitMutada);
        itera = itera + 1;
    end
    
    %%%%% S = 0; %%%%%
end

