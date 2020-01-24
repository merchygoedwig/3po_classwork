%3PO: Tutorial 3, Question 2
%Genevieve Clifford (1779290), University of Birmingham
%sxc1065@student.bham.ac.uk / genevieve@becquerel.me

clear all; clc;

P=[0.6;0.4];
A=[1/2 1/3;1/5 1/4;2 -1];
b=[300;200;0];
lb=[0;0];
intcon=[1,2];
[x,fval]=linprog(-P,A,b,[],[],lb);

[xi,fvi]=intlinprog(-P,intcon,A,b,[],[],lb);

fvi=-fvi;
fval=-fval;

clc

fs1='Using linprog, %3.2f and %3.2f gold and silver boxes are produced. intlinprog gives %i and %i.\nThese represent costs for the former method of £%3.2f and the latter of £%3.2f\n';
fprintf(fs1,x(1),x(2),uint16(xi(1)),uint16(xi(2)),fval,fvi)