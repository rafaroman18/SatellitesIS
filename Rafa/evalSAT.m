function [e]=evalSAT(x)

f=20*x(1)+25*x(2)-30*x(3)-45*x(4)+40*x(5);

%% ejercicio resuelto

e1=(x(1)+x(2)-x(3)+x(4)+x(5))<1;
e2=(x(1)+x(2)-x(4)+2*x(5))<2;
e3=(-x(2)+x(4)+x(5))>1;
e4=(x(2)+x(3)+x(5))>2;


%% penalization
e=f+e1*70+e2*70+e3*100+e4*100;

end