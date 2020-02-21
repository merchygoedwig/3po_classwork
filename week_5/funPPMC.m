function R = funPPMC(x,y)
% A function for calculating the Pearson Product Moment Correlation for two
% matrices, x and y
n=numel(x);
term1=n.*sum(x.*y);
term2=sum(x);
term3=sum(y);
term4=n.*sum(x.^2);
term5=(sum(x).^2);
term6=n.*sum(y.^2);
term7=(sum(y).^2);

top=term1-(term2.*term3);
bottom=(term4-term5).*(term6-term7);
R=top./sqrt(bottom);
end

