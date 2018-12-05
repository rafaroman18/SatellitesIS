function [S,itera] = AG_Satels(NSatels,NManagers)
    NPoblacion = 16; % Numero de individuos de la poblacion
    MAX_itera = 3000;
    rand('seed',5);
    Satelites = randi(501,2,NSatels) - 1;
    Distancias = distancias(Satelites);
    % Poblacion inicial
    Pob = GeneraPoblacion_Satels(NSatels,NManagers,NPoblacion);
    FitPob = EvaluaPoblacion_Satels(Pob);
    itera = 1;
    
    while itera <= MAX_itera
        Padres = Seleccion_Satels(FitPob,5); % Devuelve los indices de los padres que se cruzaran usando k = 5
        parejas = Emparejar_Satels(Padres,NPoblacion);
        newPob = Cruzar_Satels(parejas,Pob); % Devuelve nueva poblacion cruzada
        newPobMutada = Mutar_Satels(newPob); % Poblacion con mutaciones
        FitMutada = EvaluaPoblacion_Satels(newPobMutada);
        [Pob,FitPob] = Reemplazo_Satels(newPobMutada,FitMutada);
        itera = itera + 1;
    end
    
    %%%%% S = 0; %%%%%
end

