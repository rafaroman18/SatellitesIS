clc; clear all;

addpath('./Taboo/');
addpath('./Genetic/');

rand('seed',5);

tenure      = 4;
MAX_IT      = 1000;
nSatelites  = 500;
nRep        = 40;
nPob        = 10;
iteraciones = 10;



for i = 1:iteraciones
    [bestTaboo(i,:),fitBestTaboo(i)] = Taboo_Satels(nSatelites, nRep, MAX_IT, tenure);
    [~ , fitBestAG]          = AG_Satels(nSatelites, nRep, nPob, MAX_IT);
    fitBestAG(i) = min(fitBestAG);
end