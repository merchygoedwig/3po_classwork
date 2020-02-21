%3PO: Past Paper, Question ii
%Genevieve Clifford (1779290), University of Birmingham
%sxc1065@student.bham.ac.uk / genevieve@becquerel.me

clear all; close all; clc;

P=[2.9;2.07;2.65;1.87];
A=[4 4 3 3;-1 0 0 0;0 -1 0 0;0 0 -1 0;0 0 0 -1];
b=[3.6e5;-23e3;-26.5e3;-23e3;-26.5e3];
lb=[0;0;0;0];
ub=[3200;4800;3200;4800].*7;

[x,fval]=linprog(-P,A,b,[],[],lb,ub);

fval=-fval;

% formatSpec='A profit of £%5.0f is to be made by producing set 1 and £%5.0f for set 2\n';
% fprintf(formatSpec,fval,fval2)