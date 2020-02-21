%3PO: Example Paper 7, Question 7
%Genevieve Clifford (1779290), University of Birmingham
%sxc1065@student.bham.ac.uk / genevieve@becquerel.me

format shortg

clear all; close all; clc;

P=[0.064;0.096;0.06;0.14];
A=[-0.4 -0.6 0 0;0 0 -0.3 -0.7;0.4 0.6 0 0;0 0 0.3 0.7;0 1 1 0;1 0 0 0;0 0 0 1];
b=[-2000;-2000;8000;10000;6000;1e9;1e9];
lb=[0;0;0;0];
Aeq=[1 -4/6 0 0;0 0 1 -3/7];
beq=[0;0];

[x,fval]=linprog(-P,A,b,Aeq,beq,lb);

fval=-fval;

prodX=0.6*x(1)+0.4*x(2);
prodY=0.3*x(3)+0.7*x(4);