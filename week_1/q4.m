%3PO: Tutorial 1, Question 4
%Genevieve Clifford (1779290), University of Birmingham
%sxc1065@student.bham.ac.uk / genevieve@becquerel.me

clear all; close all; clc;

m=5;

cost=[10;15;2];
nC=length(cost);
unitLim=[2000;600];
nuL=length(unitLim);
compConstrVar=[-900;-2100;-2400;-3000;-4300];
for a=1:m
    compConstrVar(m+a)=1900;
end
lb=zeros(nC*m,1);
lb(end)=300;
% ub=zeros(nC*m,1);
% ub(end-m+1:end)=1900;

f=zeros(m,1);

for i=1:nC
    a=cost(i)*ones(m,1);
    f(1+(i-1)*m:m+(i-1)*m,1)=a;
end

simpConstr=[eye(nuL*m) zeros(nuL*m,m)];

simpConstrVar=zeros(m*nuL,1);

for j=1:nuL
    simpConstrVar(1+(j-1)*m:m+(j-1)*m,1)=ones(m,1)*unitLim(j);
end

construct1=zeros(m);
for k=1:m-1
    construct1(k+1,k)=1;
end

compConstr=[-eye(m) -eye(m) eye(m)-construct1];
compConstr(end)=0;
construct2=[zeros(m,2*m) eye(m)];
compConstr=vertcat(compConstr,construct2);

constr=[simpConstr;compConstr];
constrVar=vertcat(simpConstrVar,compConstrVar);

[x,fval]=linprog(f,constr,constrVar,[],[],lb);
x=x';

formatSpec='There is a total cost of £%6.2f with units produced internally, externally and stored below.\n';
fprintf(formatSpec,fval)

T=array2table(x);
T.Properties.VariableNames={'IUM1','IUM2','IUM3','IUM4','IUM5','EUM1','EUM2','EUM3','EUM4','EUM5','NS1','NS2','NS3','NS4','NS5'}