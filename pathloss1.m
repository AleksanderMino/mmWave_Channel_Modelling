function[path_loss]=pathloss1(m,n,x)
% k=1;
% p=1;
% B=[180,	180
% 180,	110
% 140	155
% 135	110
% 90	110
% 80	170
% 150	10
% 30	155
% 40	100
% 15	25
% 140	60
% 70	25
% 40	60
% 10  65];

B=[190	190
190	120
150	165
145	120
100	120
90	180
160	20
40	165
50	110
25	35
150	70
80	35
50	70
20	75];



% d=zeros(1,14);
% path_loss=zeros(1,14);
% for x=1:14
    d=sqrt((m-B(x,1))^2+((201-n)-B(x,2))^2+(1.5-6)^2);
    path_loss=pathlossmodel(d);
%     k=k+1;
%     p=p+1;
end
% path_loss_sum=sum(path_loss);
% end
%% cumulative distributive function
%mu=sum(path_loss)/(k-1);
%sigma=std(path_loss);
%Y=cdf("LogNormal",path_loss,mu,sigma);
%plot(Y)
%% 
