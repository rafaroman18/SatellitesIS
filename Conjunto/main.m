function S = main()
    % clc; clear all;

    addpath('./Taboo/');
    addpath('./Genetic/');

    rand('seed',5);

    tenure       = 4;
    MAX_IT       = 1000;
    nSatelites   = 500;
    nRep         = 40;
    nPob         = 50;
    iteraciones  = 10;

    tiemposAG = zeros(1,iteraciones);
    tiemposTab = zeros(1,iteraciones);

    fitBestAG = zeros(1,iteraciones);
    fitBestTab = zeros(1,iteraciones);
    
    numItrsAG = zeros(1,iteraciones);
    numItrsTab = zeros(1,iteraciones);

    for i = 1:iteraciones
        tic
        [NItsTab,FitTab] = Taboo_Satels(nSatelites, nRep, MAX_IT, tenure);
        tiemposTab(i) = toc;
        fitBestTab(i) = FitTab;
        numItrsTab(i) = NItsTab;
    
        tic
        [NItsAG,FitAG] = AG_Satels(nSatelites, nRep, nPob, MAX_IT);
        tiemposAG(i) = toc;
        fitBestAG(i) = -max(FitAG);
        numItrsAG(i) = NItsAG;
    end
    
    disp('BÚSQUEDA TABOO');
    x1 = ['Tiempos:     ',num2str(tiemposTab)];
    disp(x1);
    x2 = ['Valoracs.:   ',num2str(fitBestTab)];
    disp(x2);
    x3 = ['Num. Iters.: ',num2str(numItrsTab)];
    disp(x3);
    
    disp('ALGORITMO GENÉTICO');
    x1 = ['Tiempos:     ',num2str(tiemposAG)];
    disp(x1);
    x2 = ['Valoracs.:   ',num2str(fitBestAG)];
    disp(x2);
    x3 = ['Num. Iters.: ',num2str(numItrsAG)];
    disp(x3);
end