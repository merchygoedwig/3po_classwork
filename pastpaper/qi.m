%3PO: Past Paper, Question i
%Genevieve Clifford (1779290), University of Birmingham
%sxc1065@student.bham.ac.uk / genevieve@becquerel.me

clear all; close all; clc;

P1=[2.9;2.65];
P2=[2.07;1.87];
A=[4 3];
b=[(3.6e5)/7];
lb=[0;0];
ub1=[3200;3200];
ub2=[4800;4800];

[x1,fval1]=linprog(-P1,A,b,[],[],lb,ub1);
[x2,fval2]=linprog(-P2,A,b,[],[],lb,ub2);

fval1=-fval1;
fval2=-fval2;

formatSpec='A profit of £%5.0f is to be made by producing set 1 and £%5.0f for set 2\n';
fprintf(formatSpec,fval1,fval2)