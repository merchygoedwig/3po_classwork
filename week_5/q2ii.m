clear all; close all; clc;

x=[43 21 25 42 57 59];
y=[99 65 79 75 87 81];

R=funPPMC(x,y);
sigx=std(x);
sigy=std(y);
mux=mean(x);
muy=mean(y);

b=R.*(sigy./sigx);
a=muy-b.*mux;

linfun=@(g) a+b.*g;

yh=linfun(x);

statement=['The line of best fit is: y = ',num2str(a),' + ',num2str(b),'x.'];
disp(statement)
fs='The value of R is: %4.3f\nThe value of R^2 is: %4.3f\n';
fprintf(fs,R,R.^2)

plot(x,yh,'k',x,y,'og')
hold on
xlabel('Age (years)')
ylabel('Glucose level (units)')