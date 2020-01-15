%3PO: Tutorial 1, Question 1
%Genevieve Clifford (1779290), University of Birmingham
%sxc1065@student.bham.ac.uk / genevieve@becquerel.me

clear all; close all; clc;

P=[20;30];
A=[1 2;1 1];
b=[120;90];
lb=[0;0];
ub=[70;50];

[x,fval]=linprog(-P,A,b,[],[],lb,ub);

fval=-fval;

formatSpec='A profit of £%4.2f is to be made by producing %2.0f low-cost and %2.0f high-cost units respectively';
fprintf(formatSpec,fval,x(1),x(2))
