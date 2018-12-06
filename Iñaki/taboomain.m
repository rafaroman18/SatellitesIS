current = logical(randi(2,1,10)-1);
matPos  = rand(2,length(current));
best = current;

n        = length(current);
MAX_IT   = 1000;
it       = 1;
TabuList = zeros(1,n); 
tenure   = 4;

while (it <= MAX_IT)
    cont = 1;
    [list_suc, posChanged] = sucesores(current, matPos);
    
    while ~isempty(list_suc) %&& nuevo estado no es generado
        
        new = logical(list_suc(cont,:));
        
        if (fEval(new, matPos) < fEval(current, matPos)) %new es mejor
        
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

end