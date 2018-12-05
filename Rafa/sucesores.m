function s=sucesores(x)
cont = 1;
s={};
while(cont<=size(x,2))
    
    if x(cont)== 1
        vector = x;
        vector(cont)=0;
        if(isempty(s)==1)  
            s=[vector evalSAT(vector) cont];
        else
            s = [vector evalSAT(vector) cont;s];
        end
        
    elseif x(cont)==0
        vector = x;
        vector(cont)=1;
        if(isempty(s))  
            s=[vector evalSAT(vector) cont];
        else
            s = [vector evalSAT(vector) cont;s];
        end
    end
    cont = cont+1;
end
s=sortrows(s,size(x,2)+1);
s(:,size(x,2)+1)=[];
end