%3PO: Tutorial 2, Question 1
%Genevieve Clifford (1779290), University of Birmingham
%sxc1065@student.bham.ac.uk / genevieve@becquerel.me

clear all; close all; clc;

P=[6*1.5;7.5*2];
A=[20 60;1.5 2];
b=[60;3];
lb=[0;0];


[x,fval]=linprog(-P,A,b,[],[],lb,[]);

fval=-fval;
clc


disp('The following results are expected: ')
fs1='Area cabbage (m^2): %1.2f\tWeight cabbage(kg): %1.2f\nArea tomato (m^2): %1.2f\t\tWeight tomato(kg): %1.2f\n\n';
fprintf(fs1,x(1),x(1)*1.5,x(2),x(2)*2)

fs2='A profit of £%2.2f is expected to be made\n';
fprintf(fs2,fval)