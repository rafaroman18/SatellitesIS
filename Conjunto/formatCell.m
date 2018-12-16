load('tabooCell.mat');
load('AGCell.mat');

tabooMatrix = zeros(size(tabooCell));
AGMatrix    = zeros(10,10);

AGMatrix = cell2mat(AGCell(:,2,:));
AGMatrix = a(:,:); %Poblacion x iteracion