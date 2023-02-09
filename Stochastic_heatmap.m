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
% 
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


k=1.38*10^(-23);
T=290;
B=500*10^6;
thermalnoise=1000*k*T*B;
power=zeros(1,14);
gain=10^(6/10);

colorrss=zeros(200);
colorsnr=zeros(200);

for i=1:a/l
for j=1:b/l

if(J(i,j)~=0)
    for x=1:14
        p(x)=10^((30-pathloss2(i,j,x))/10);
%         gain(x)=10^(gaindB(i,j,x)/10);
        power(x)=p(x)*gain;
    

    end 

    NF=7;
 rss=max(power);
else
    rss=0;
end
%  snr(c)=rss(c)/thermalnoise;
rssdb=10*log10(rss);
snrdb=rssdb-10*log10(thermalnoise)-NF;
% snrdb(c)=10*log10(snr(c))-NF;

   colorrss(i,j)=rssdb;
   colorsnr(i,j)=snrdb;

end
end 

colorrss1=flipud(colorrss);
colorsnr1=flipud(colorsnr);



% for i=1:a/l
% for j=1:b/l
% 
% if(J(i,j)~=0)
%     for x=1:14
%         p(x)=10^((30-pathloss1(i,j,x))/10);
% %         gain(x)=10^(gaindB(i,j,x)/10);
%         power(x)=p(x)*gain;
%     
% 
%     end 
% 
%     NF=7;
%  rss(c)=max(power);
% else
%     rss(c)=0;
% end
% %  snr(c)=rss(c)/thermalnoise;
% rssdb(c)=10*log10(rss(c));
% snrdb(c)=rssdb(c)-10*log10(thermalnoise)-NF;
% % snrdb(c)=10*log10(snr(c))-NF;
% 
%      c=c+1;
% 
% 
% end
% end 
% 
% colorrss = reshape(rssdb,200,200);
% colorrss1=colorrss';
% colorsnr = reshape(snrdb,200,200);
% colorsnr1=colorsnr';

% figure(4)
% h1=contourf(colorrss,500,'linestyle','no');
% colormap jet
% caxis([-53 -14])
% colorbar
% title('Heatmap for Received Signal Strength')
% 
% figure(5)
% contourf(colorsnr,500,'linestyle','no');
% colormap jet
% caxis([21 63])
% colorbar

figure(4)
pcolor(colorrss1)
shading flat
shading interp
colormap jet
caxis([-56 -14])
colorbar
title('Heatmap for Received Signal Strength')

figure(5)
pcolor(colorsnr1)
shading flat
shading interp
colormap jet
caxis([23 65])
colorbar
title('Heatmap for Signal to Noise Ratio')


% colorrss1 = reshape(rssdb,200,200);
% colorrss =colorrss1.';
% colorsnr1 = reshape(snrdb,200,200);
% colorsnr =colorsnr1.';



% labelnumber=zeros(1,200);
% for nm=1:200
%     labelnumber(nm)=201-nm;
% end
% 
% figure(4)
% h1=heatmap(colorrss,'Colormap',jet,'ColorLimits',[-55 -13]);
% h1.Title='Received Signal Strength';
% h1.XLabel = 'Location x in meters';
% h1.YLabel = 'Location y in meters';
% ax1=gca;
% MyYticklabel1=zeros(size(ax1.YDisplayLabels));
% for na=1:200
% MyYticklabel1(na)=labelnumber(na);
% end
% ax1.YDisplayLabels=MyYticklabel1;
% 
% 
% figure(5)
% h2=heatmap(colorsnr,'Colormap',jet,'ColorLimits',[21 63]);
% % h2=HeatMap(colorsnr,'Colormap',turbo);
% h2.Title='Signal to Noise Ratio';
% h2.XLabel = 'Location x in meters';
% h2.YLabel = 'Location y in meters';
% ax2=gca;
% MyYticklabel2=zeros(size(ax2.YDisplayLabels));
% for na=1:200
% MyYticklabel2(na)=labelnumber(na);
% end
% ax2.YDisplayLabels=MyYticklabel2;
% % hold on
% % plot(BSX,BSY,'*','Color','red','MarkerSize',15);
% % hold off
% 
