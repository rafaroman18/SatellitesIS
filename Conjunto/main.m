    clc; clear all;

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
    
    numItrsAG  = zeros(iteraciones,nPob,nSatelites);
    numItrsTab = zeros(iteraciones,nSatelites);

    tabooCell  = cell(2,3);
    AGCell     = cell(10,3);
    
    
    for i = 1:iteraciones
        for j=1:2
        tic
        [NItsTab,FitTab] = Taboo_Satels(nSatelites, nRep, MAX_IT, j*2);
        tiemposTab(i) = toc;
        fitBestTab(i) = FitTab;
        numItrsTab(i,:) = NItsTab;

        tabooCell{j,1,i} = tiemposTab(i);
        tabooCell{j,2,i} = fitBestTab(i);
        tabooCell{j,3,i} = numItrsTab(i,:);
        end
        
        for j=1:10
        tic
        [NItsAG,FitAG] = AG_Satels(nSatelites, nRep, j*10, MAX_IT);
        tiemposAG(i) = toc;
        fitBestAG(i) = -max(FitAG);
        %numItrsAG(i,:,:) = NItsAG;
        
        AGCell{j,1,i} = tiemposAG(i);
        AGCell{j,2,i} = -max(FitAG);
        AGCell{j,3,i} = NItsAG;
        end
    end
    
%     disp('BÚSQUEDA TABOO');
%     x1 = ['Tiempos:     ',num2str(tiemposTab)];
%     disp(x1);
%     x2 = ['Valoracs.:   ',num2str(fitBestTab)];
%     disp(x2);
%     x3 = ['Num. Iters.: ',num2str(numItrsTab)];
%     disp(x3);
%     
%     disp('ALGORITMO GENÉTICO');
%     x1 = ['Tiempos:     ',num2str(tiemposAG)];
%     disp(x1);
%     x2 = ['Valoracs.:   ',num2str(fitBestAG)];
%     disp(x2);
%     x3 = ['Num. Iters.: ',num2str(numItrsAG)];
%     disp(x3);