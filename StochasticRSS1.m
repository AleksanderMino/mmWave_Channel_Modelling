

I=imread("E:\KTH\Y2P1\IK2200\Tools\mm-Wave_Tool\RayTracer\Diff_Building1.jpg");   
I = rgb2gray(I);     


a=200; 
b=200; 
c=1;
l=1;    
M = imresize(I,[a/l b/l]);
J=floor(M/255);     

k=1.38*10^(-23);
T=290;
B=2*10^9;
thermalnoise=1000*k*T*B;
% axes('GridLineStyle', '-'); 
% hold on 
% grid on
% axis([0,a,0,b]); 
% set(gca,'xtick',0:1:a,'ytick',0:1:b); 
% power=zeros(1,14);
% gain=10^(6/10);

for i=1:a/l
for j=1:b/l 

if(J(i,j)~=0)
    for x=1:14
        p(x)=10^((30-pathloss2(i,j,x))/10);
%         gain(x)=10^(gaindB(i,j,x)/10);
        power(x)=p(x)*gain;
    end
% else
%      y=[i,i,i+1,i+1]*l; 
%      x=[j,j+1,j+1,j]*l;   
%      h=fill(x,y,'black'); 
%      hold on 
    
end
    NF=7;
 rss(c)=max(power);
%  snr(c)=rss(c)/thermalnoise;
rssdb(c)=10*log10(rss(c));
snrdb(c)=rssdb(c)-10*log10(thermalnoise)-NF;
% snrdb(c)=10*log10(snr(c))-NF;

     c=c+1;


end
end 
%end



figure(2);
cdfplot(rssdb);
title('Received Signal Strength')
xlabel('RSS value')
ylabel('CDF')


figure(3);
cdfplot(snrdb);
title('Signal to Noise Ratio')
xlabel('SNR value')
ylabel('CDF')
