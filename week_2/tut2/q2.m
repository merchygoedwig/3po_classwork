%3PO: Tutorial 2, Question 2
%Genevieve Clifford (1779290), University of Birmingham
%sxc1065@student.bham.ac.uk / genevieve@becquerel.me

clear all; close all; clc;

P=[8.1;10.8];
A=[0.8 0.44;0.05 0.1;0.1 0.36];
b=[24000;2000;6000];
lb=[0;0];


[x,fval]=linprog(-P,A,b,[],[],lb,[]);

fval=-fval;
clc

fs1='%6.1f bbl/day of crude oil 1 is to be made\n%6.1f bbl/day of crude oil 2 is to be made\nThis corresponds to a profit of $%6.2f/day.\n';
fprintf(fs1,x(1),x(2),fval)