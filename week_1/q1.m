%3PO: Tutorial 1, Question 1
%Genevieve Clifford (1779290), University of Birmingham
%sxc1065@student.bham.ac.uk / genevieve@becquerel.me

clear all; close all; clc;

P=[20;30];
A=[1 2;1 1];
b=[120;90];
lb=[0;0];
ub=[70;50];

[x,fval]=linprog(-P,A,b,[],[],lb,ub)

fval=-fval;