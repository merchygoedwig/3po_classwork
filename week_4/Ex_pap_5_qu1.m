clear; close all; clc
%note this tracks the travelling salesman problem in the matlab help files.
A=[0   2	100	12	5
   2   0	4	8	100
   100 4	0	3	3
   12  8    3   0   10
   5   100  3   10  0];  %matrix of distances note arbitarily high values given to non-permissible routes
sizeA=size(A);  %find size of A
nstops=max(size(A)); %number of stops is the biggest part of the size of A (which should be square)

idxs = nchoosek(1:nstops,2);  %uses an in built matlab function to work out the independent binary interactions
%type idxs at prompt to look at it, then should be 'obvious' what it is
%doing
Lidxs=length(idxs); %how many values in idxs
c1=idxs(:,1); %select first column
c2=idxs(:,2);
dist=zeros(Lidxs,1);
for i=1:Lidxs
    dist(i)=A(c1(i),c2(i)); %the required distances between each set of points is found from A
end

%set up constraints (these are what make a TSP hard) these are taken from
%example in matlab
Aeq = spones(1:length(idxs)); % Adds up the number of trips
beq = nstops;

Aeq = [Aeq;spalloc(nstops,length(idxs),nstops*(nstops-1))]; % allocate a sparse matrix
for ii = 1:nstops
    whichIdxs = (idxs == ii); % find the trips that include stop ii
    whichIdxs = sparse(sum(whichIdxs,2)); % include trips where ii is at either end
    Aeq(ii+1,:) = whichIdxs'; % include in the constraint matrix
end
beq = [beq; 2*ones(nstops,1)];

%set boundaries (these are binary here, so low is 0 and upper is 1)
intcon = 1:Lidxs;
lb = zeros(Lidxs,1);
ub = ones(Lidxs,1);

%solve
opts = optimoptions('intlinprog','Display','off');
[x_tsp,costopt,exitflag,output] = intlinprog(dist,intcon,[],[],Aeq,beq,lb,ub,opts);

vals=find(x_tsp); %select values that are 1 in x_tsp (the solution)
disp('min distance')
total_dist=sum(dist(vals)) %find the minimum distance

[x_tsp dist idxs] 
