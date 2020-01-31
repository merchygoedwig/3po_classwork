%3PO: Tutorial 4, Question 2
%Genevieve Clifford (1779290), University of Birmingham
%sxc1065@student.bham.ac.uk / genevieve@becquerel.me

clear all; close all; clc;

lb=zeros(1,6);

Aeq=[eye(3) eye(3)];
beq=[200;300;250];

A=[ones(1,3) zeros(1,3);zeros(1,3) ones(1,3)];
b=[300;500];

fobj=[30;28;26;23;25;27];

[x,fval]=linprog(fobj,A,b,Aeq,beq,lb);
