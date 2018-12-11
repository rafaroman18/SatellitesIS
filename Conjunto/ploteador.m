a = cell2mat(tabooCell(:,1,:));
a = a(:,:);

for i=1:10
   media(i) = mean(a(i,:));
    
end

plot(2:2:20,media,'b','Linewidth',3); hold on;
plot(2:2:20,media,'k.','MarkerSize',20);
xlabel('Tenure'); 
ylabel('Tiempo');
title('Tiempo por tenure');

hold off;