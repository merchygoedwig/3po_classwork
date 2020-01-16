%3PO: Tutorial 1, Question 2
%Genevieve Clifford (1779290), University of Birmingham
%sxc1065@student.bham.ac.uk / genevieve@becquerel.me

clear all; close all; clc;

P=[20;30];
A=[1 0;2 1;2 5;0 1];
b=[2;12;36;4];
lb=[0;0];

[x,fval]=linprog(P,-A,-b,[],[],lb,[]);

for i=1:length(A)
    vit(i,:)=A(i,:).*x';
    vitS=sum(vit,2);
end

vitS=vitS';

formatSpec='There is a total cost of £%4.2f from using %1.0f boxes of additive 1 and %1.0f boxes of additive 2.\n';
fprintf(formatSpec,fval,x(1),x(2))

T=array2table(vitS);
T.Properties.VariableNames={'Vitamin A/g','Vitamin B/g','Vitamin C/g','Vitamin D/g'}