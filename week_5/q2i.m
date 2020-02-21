clear all; close all; clc;

x=[96 52 72 32 58 61];
y=[318 178 220 98 185 203];

R=funPPMC(x,y);
sigx=std(x);
sigy=std(y);
mux=mean(x);
muy=mean(y);

b=R.*(sigy./sigx);
a=muy-b.*mux;

linfun=@(g) a+b.*g;

yh=linfun(x);

plot(x,yh,x,y,'*')
hold on
xlabel('H_{2}O (%w/w)')
ylabel('\Delta{H} (J/g)')

rssmat=zeros(1,length(y));

for i=1:length(y)
    rssmat(i)=(yh(i)-y(i)).^2;
end

rss=sum(rssmat);

formatSpec='The value of R is %4.3f, the value of R^2 is %4.3f and the RSS is %6.3f\n';
fprintf(formatSpec,R,R.^2,rss)