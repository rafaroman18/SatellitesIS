function [Best,C] = taboo()
Current = [1 0 0 0 1];
n=(size(Current,2));
Best = Current;
LastCurrent = Current;
SuccessorList = sucesores(Current);
TabuList = zeros(1,n);

while(evalSAT(Best)>20)
cont = 1;
SuccessorList = sucesores(Current);
while(isempty(SuccessorList)==0)
    New = SuccessorList(cont,:);    
    if evalSAT(New(:,1:n))<evalSAT(Best)
        Current = New(:,1:n);
        Best = Current;
        TabuList(New(:,n+1))=4;        
        SuccessorList={};
    elseif TabuList(New(:,n+1))==0
       Current = New(:,1:n);
       TabuList(New(:,n+1))=4;
       SuccessorList={};
    else
    end
    cont = cont+1;
end 
        for i=1:1:n
            if(TabuList(i)~=0)
                TabuList(i)=TabuList(i)-1;
            end
        end    
end
C = evalSAT(Best);
end