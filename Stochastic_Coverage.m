% function Stochastic_Coverage(Handle)


I=imread("E:\KTH\Y2P1\IK2200\Tools\mm-Wave_Tool\RayTracer\Diff_Building1.jpg");   
I = rgb2gray(I);     


a=200; 
b=200; 
c=1;
l=1;    
M = imresize(I,[a/l b/l]);
J=floor(M/255);     


% BSX=[180	
% 180	
% 140	
% 135	
% 90	
% 80	
% 150	
% 30	
% 40	
% 15	
% 140	
% 70	
% 40	
% 10  ];

BSX=[190
190
150
145
100
90
160
40
50
25
150
80
50
20];




% BSY=[	180
% 	110
% 	155
% 	110
% 	110
% 	170
% 	10
% 	155
% 	100
% 	25
% 	60
% 	25
% 	60
%   65];

BSY=[190
120
165
120
120
180
20
165
110
35
70
35
70
75];




k=1.38*10^(-23);
T=290;
B=500*10^6;
thermalnoise=1000*k*T*B;
figure(1)
axes; 
hold on 


axis([0,a,0,b]); 
set(gca,'xtick',0:10:a,'ytick',0:10:b); 

power=zeros(1,14);
gain=10^(6/10);



for i=1:a/l
for j=1:b/l

if(J(i,j)~=0)
    for x=1:14
        p(x)=10^((30-pathloss2(i,j,x))/10);
%         gain(x)=10^(gaindB(i,j,x)/10);
        power(x)=p(x)*gain;
    
    end 

    NF=7;
 rss(c)=max(power);
%  snr(c)=rss(c)/thermalnoise;
rssdb(c)=10*log10(rss(c));
snrdb(c)=rssdb(c)-10*log10(thermalnoise)-NF;
% snrdb(c)=10*log10(snr(c))-NF;

        if (snrdb(c) > 5)
            hold on 
%             y=[i,i,i+1,i+1]*l; 
%             x=[j,j+1,j+1,j]*l;   
%             h=fill(x,y,'yellow'); 


            y=[200-i,200-i,201-i,201-i]*l; 
            x=[j-1,j,j,j-1]*l;   
            h=fill(x,y,'yellow','LineStyle','none'); 

              
        end

         c=c+1;

else
hold on 


            y=[200-i,200-i,201-i,201-i]*l; 
            x=[j-1,j,j,j-1]*l;   
            h=fill(x,y,'black','LineStyle','none'); 


%      y=[i,i,i+1,i+1]*l; 
%      x=[j,j+1,j+1,j]*l;   
%      h=fill(x,y,'black'); 

end

end 
end

hold on
plot(BSX,BSY,'*','Color','red','MarkerSize',12)
xlabel('Location x in meters')
ylabel('Location y in meters')
title('Coverage with SNR cutoff of 5dB')


% figure(1);
% cdfplot(rssdb);
% title('RSS')
% 
% figure(2);
% cdfplot(snrdb);
% title('SNR')