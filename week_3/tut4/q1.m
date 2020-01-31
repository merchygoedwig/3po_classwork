%3PO: Tutorial 4, Question 1
%Genevieve Clifford (1779290), University of Birmingham
%sxc1065@student.bham.ac.uk / genevieve@becquerel.me

clear all; close all; clc;

fobj=ones(1,7);
lb=zeros(1,7);

A_element=[1 0 0 1 1 1 1];
A=zeros(length(fobj));

for i=1:length(fobj)
    A(i,:)=circshift(A_element,i-1);
end

b=[10;12;20;17;15;12;5];

[x,fval]=linprog(fobj,-A,-b,[],[],lb);

for i=1:length(fobj)
    xc(i)=sum(A(i,:).*x');
end

disp('Table of people starting on each day:')
T1=array2table(x');
T1.Properties.VariableNames={'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'}

disp('Table of people in work on each day:')
T2=array2table(xc);
T2.Properties.VariableNames={'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'}

fprintf('The total number of staff required for the schedule is %i\n',fval)