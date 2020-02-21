clc; clear; close all;
%x1-x4=shampoo #1, x5-x8-Shampoo #2 etc.
p1=[2.9.*ones(4,1); 2.07.*ones(4,1);2.65.*ones(4,1);1.87.*ones(4,1)];
%just the profit so selling price-raw materials and packing
f=[0.1;0.15;0.2;0.18];
p2=[f;f;f;f];
%cost of transporting
P=p1-p2;
%overall objfunc (profit)
lb=zeros(16,1);
ub=[6000;5000;5500;6500;6500;6000;5500;8500;6000;5000;5500;6500;6500;6000;5500;8500];
%max=demand of each prod at each warehouse
a1=zeros(4,16);
a1(1,1)=1;a1(1,5)=1;a1(1,9)=1;a1(1,13)=1;
a1(2,2)=1;a1(2,6)=1;a1(2,10)=1;a1(2,14)=1;
a1(3,3)=1;a1(3,7)=1;a1(3,11)=1;a1(3,15)=1;
a1(4,4)=1;a1(4,8)=1;a1(4,12)=1;a1(4,16)=1;
%constraints for demand from each warehouse
a2=[4.*ones(1,4) 4.*ones(1,4) 3.*ones(1,4) 3.*ones(1,4)];
%max production time constraint
a3=zeros(4,16);
a3(1,1)=1;a3(1,2)=1;a3(1,3)=1;a3(1,4)=1;
a3(2,5)=1;a3(2,6)=1;a3(2,7)=1;a3(2,8)=1;
a3(3,9)=1;a3(3,10)=1;a3(3,11)=1;a3(3,12)=1;
a4(4,13)=1;a4(4,14)=1;a4(4,15)=1;a4(4,16)=1;
%max production quantity constraint
A=[a2;a1;a3];
b=[360000;25000;22000;22000;30000;22400;33600;22400;33600];
[x,fval]=linprog(-P,A,b,[],[],lb,ub);
fval1=-fval-1000-1250-1500-1750;
X1=x(1)+x(2)+x(3)+x(4);
X2=x(5)+x(6)+x(7)+x(8);
X3=x(9)+x(10)+x(11)+x(12);
X4=x(13)+x(14)+x(15)+x(16);
X5=x(1)+x(5)+x(9)+x(13);
X6=x(2)+x(6)+x(10)+x(14);
X7=x(3)+x(7)+x(11)+x(15);
X8=x(4)+x(8)+x(12)+x(16);

fprintf('The maximum projected profit is:\n £%6.2f \n',fval1);
fprintf('Hair shampoo #1 produced in a week:\n %6.0f bottles \n',X1);
fprintf('Hair shampoo #2 produced in a week:\n %6.0f bottles\n',X2);
fprintf('Hair conditioner #1 produced in a week:\n %6.0f bottles\n',X3);
fprintf('Hair conditioner #2 produced in a week:\n %6.0f bottles\n',X4);
fprintf('total number of bottles sent to warehouse 1 is:\n %6.0f bottles \n',X5);
fprintf('total number of bottles sent to warehouse 2 is:\n %6.0f bottles \n',X6);
fprintf('total number of bottles sent to warehouse 3 is:\n %6.0f bottles \n',X7);
fprintf('total number of bottles sent to warehouse 4 is:\n %6.0f bottles \n',X8);


x
