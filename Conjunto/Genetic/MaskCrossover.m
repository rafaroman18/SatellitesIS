function C = MaskCrossover(A,B,NManagers)

%We create the Mask
Mask = randi([0,1],1,size(A,2));

C = zeros(2,size(A,2));
C = logical(C);

%First Son: 0 to the first parent, 1 to parent 2
    m1 = find(Mask ==false); %Positions where Mask is 0 .
    m2 = find(Mask == true);    %Positions where Mask is 1.
    C(1,m1) = A(m1);
    C(1,m2) = B(m2);
    
%Second Son: 0 to the parent 2, 1 to the parent 1
    m1 = find(Mask == true);      %Positions where Mask is 1.
    m2 = find(Mask == false); %Positions where Mask is 0.
    C(2,m1) = A(m1);
    C(2,m2) = B(m2);

    if sum(C(1,:))<NManagers
        ind = find(C(1,:)==false);
        rnd = randperm(length(ind));
        rnd = rnd(1:NManagers-sum(C(1,:)));        
        C(1,ind(rnd))=~C(1,ind(rnd));
    elseif sum(C(1,:))>NManagers
        ind = find(C(1,:)==true);
        rnd = randperm(length(ind));
        rnd = rnd(1:sum(C(1,:))-NManagers); 
        C(1,ind(rnd))=~C(1,ind(rnd));
    end
    
    if sum(C(2,:))<NManagers
        ind = find(C(2,:)==false);
        rnd = randperm(length(ind));
        rnd = rnd(1:NManagers-sum(C(2,:)));
        C(2,ind(rnd))=~C(2,ind(rnd));
    elseif sum(C(2,:))>NManagers
        ind = find(C(2,:)==true);
        rnd = randperm(length(ind));
        rnd = rnd(1:sum(C(2,:))-NManagers); 
        C(2,ind(rnd))=~C(2,ind(rnd));
    end
end