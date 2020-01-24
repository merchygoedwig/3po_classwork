%3PO: Tutorial 3, Question 3
%Genevieve Clifford (1779290), University of Birmingham
%sxc1065@student.bham.ac.uk / genevieve@becquerel.me

clear all; clc;

P=[7.5 5 6 9];
A=[2.5 3 2 4;10 12 8 15;5 7 4 9;1 1 1 1];
b=[1400 150*60 80*60 500];
lb=[0 0 0 0];

[x,fval]=linprog(-P,A,b,[],[],lb);

x=uint16(x);

fval=-fval;

clc

fs1='A: %i\nB: %i\nC: %i\nD: %i\nProfit: %4.2f\n';
fprintf(fs1,x(1),x(2),x(3),x(4),fval)