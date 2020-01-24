%3PO: Tutorial 3, Question 1
%Genevieve Clifford (1779290), University of Birmingham
%sxc1065@student.bham.ac.uk / genevieve@becquerel.me

clear all; clc;

P=[0.75;0.6];
A=[0.3 0.2;-0.5 -0.35;0.2 0.45];
b=[15000;-24000;21000];
lb=[0;0];
ub=[40000;45000];
Aeq=[1 1];
beq=60000;

[x,fval]=linprog(P,A,b,Aeq,beq,[],[],lb,ub);

clc;

fs1='%4.0f and %4.0f units of A and B are needed respectively. The cost accrued for this is £%4.2f.\n';
fprintf(fs1,x(1),x(2),fval)