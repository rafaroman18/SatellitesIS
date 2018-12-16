nSat = 500;
nRep = 40;

matPos = rand(2,nSat)*500;
vecRep = zeros(1,nSat);
r = randperm(nRep);
vecRep(r(1:nRep)) = 1;
vecRep = logical(vecRep);
distancias = dist(matPos);
tenure = 4;

%VAR PARADA
IT_MAX = 1000;
it = 1;
stucked = 0;
%

actual = vecRep;
mejor  = actual;
salir = false;
lista_taboo = [];
lista_taboo(1,:) = mejor;
lista_taboo(1,end+1) = tenure;

tic
while it < IT_MAX && stucked < 50
    
   salir = false;
   oldFit = fEval(mejor,distancias);
   it = it+1; 
   lista_sucesores = sucesores(mejor, distancias);
   siguiente = 1;
   while ~salir && siguiente < size(lista_sucesores,1)
   
        siguiente = siguiente + 1;
        nuevo = lista_sucesores(siguiente,:);
        tabooVar = ismember(lista_taboo(:,1:end-1), nuevo,'rows');

        
        if fEval(nuevo,distancias) < fEval(mejor,distancias)
            
            actual = nuevo;
            mejor  = actual;
            salir  = true;
            if sum(tabooVar) == 0 %NO ESTABA EN LA TABOO
                lista_taboo(end+1,1:length(nuevo)) = nuevo;
                lista_taboo(end,end) = tenure;
            else
                lista_taboo(tabooVar,1:length(nuevo)) = nuevo;
                lista_taboo(tabooVar,end) = tenure;
            end
            
        else if(lista_taboo(tabooVar,end) < 1)
               
                actual = nuevo;
                lista_taboo(end+1,1:length(nuevo)) = nuevo;
                lista_taboo(end,end) = tenure;
                
            end
        end
            
   end
   tenures = tenures-1;
   newFit = fEval(mejor,distancias);
   if newFit >= oldFit
       stucked = stucked + 1;
   else
       strucked = 0;
   end
    
end
toc

disp('ESTADO INICIAL');
fEval(vecRep, distancias)
disp('ESTADO FINAL');
fEval(mejor, distancias)