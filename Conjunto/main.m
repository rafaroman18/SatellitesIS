clc; clear all;

addpath('./Taboo/');
addpath('./Genetic/');

rand('seed',5);

tenure       = 4;
MAX_IT       = 1000;
nSatelites   = 500;
nRep         = 40;
nPob         = 10;
iteraciones  = 100;
tiemposAG = zeros(1,iteraciones);
tiemposTaboo = zeros(1,iteraciones);


for i = 1:iteraciones
    tic
    [bestTaboo(i,:),fitBestTaboo(i)] = Taboo_Satels(nSatelites, nRep, MAX_IT, tenure);
    tiemposTaboo(i) = toc;
    tic
    [~ , a]          = AG_Satels(nSatelites, nRep, nPob, MAX_IT);
    tiemposAG(i) = toc;
    fitBestAG(i) = min(a);
end