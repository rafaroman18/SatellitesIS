
function [Pob_,Ev_] = ElitistReplace(Pob,NewPob,Ev,NewEv)

tempPob = [Pob;NewPob];
tempEv = [Ev,NewEv];

[tempPob,ind] = unique(tempPob,'rows');
tempEv = tempEv(1,ind);

tempPob = [tempPob,tempEv'];
tempPob = sortrows(temPob,length(tempPob),'descend');

Pob_ = tempPob(1:size(Pob,1),1:size(tempPob,2)-1);
Ev_ = tempEv(1:size(Pob,1));
end
