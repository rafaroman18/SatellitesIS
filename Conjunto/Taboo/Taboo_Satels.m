function [best,fitBest] = Taboo_Satels(NSatels, NManagers, MAX_itera, tenure)

current = zeros(1,NSatels);
r = randperm(NSatels);
current(r(1:NManagers)) = 1;

matPos = randi(501,2,NSatels) - 1; 
best = current;
distancias = dist(matPos);

n        = length(current);
it       = 1;
TabuList = zeros(1,n); 
stucked = 0;
fitOldBest = -inf;

while (it <= MAX_itera && stucked < 10)
    cont = 1;
    [list_suc, posChanged] = sucesores(current, distancias);
    while ~isempty(list_suc) %&& nuevo estado no es generado
        
        new = logical(list_suc(cont,:));
        
        if (fEval(new, distancias) < fEval(current, distancias)) %new es mejor
        
            current = new;
            best    = new;
            TabuList(posChanged(cont)) = tenure;
            list_suc = [];
            
        elseif (TabuList(posChanged(cont)) == 0)
            
            current = new;
            TabuList(posChanged(cont)) = tenure;
            list_suc = [];
            
        end
            cont = cont + 1;
            TabuList(find(TabuList)) = TabuList(find(TabuList)) - 1; 
    end
               it = it + 1;
               fitBest = fEval(best, distancias);
               if fitOldBest == fitBest
                    stucked = stucked + 1;
               else stucked = 0;
               end
               fitOldBest = fitBest;
end
   
end