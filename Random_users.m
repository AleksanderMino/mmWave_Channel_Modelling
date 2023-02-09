function[coordinates]=Random_users(n)


I=imread("E:\KTH\Y2P1\IK2200\Tools\mm-Wave_Tool\RayTracer\Diff_Building1.jpg");   
I = rgb2gray(I);     


a=200; 
b=200; 
c=1;
l=1;    
M = imresize(I,[a/l b/l]);
J=floor(M/255);

R=rand(200);

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


% figure(6)
% axes('GridLineStyle', '-'); 
% hold on 
% grid on
% axis([0,a,0,b]); 
% set(gca,'xtick',0:1:a,'ytick',0:1:b); 



J1=double(J);
R1=double(R);


P=J1.*R1;

P1=reshape(P,[1,40000]);

[randommax, randomnumber]=sort(P1,"descend");

randomx=zeros(1,n);
randomy=zeros(1,n);

k=1;
w=1;
while w<=n

    randomx1(k)=ceil(randomnumber(k)/200);
    y=mod(randomnumber(k),200);
    if y==0
        randomy1(k)=1;
    else
        randomy1(k)=201-y;
    end
    
    if randomx1(k)>=11 && randomx1(k)<=190 && randomy1(k)>=11 && randomy1(k)<=190
        randomx(w)=randomx1(k);
        randomy(w)=randomy1(k);
        w=w+1;
    end
    k=k+1;

end


% for i=1:a/l
%     for j=1:b/l
% 
%         if(J(i,j)==0)
%              y=[200-i,200-i,201-i,201-i]*l; 
%             x=[j-1,j,j,j-1]*l;   
%             h=fill(x,y,'black'); 
%         end
%     end
% end

% hold on
% plot(randomx-0.5,randomy-0.5,'p','Color','blue','MarkerSize',7)
% 
% hold on
% plot(BSX-0.5,BSY-0.5,'^','Color','red','MarkerSize',5)
% xlabel('Location x in meters')
% ylabel('Location y in meters')
% title('Random Generated Users （The blue five-pointed star is the user, and the red triangle is the base station.）')


coordinates=zeros(n,3);
for k=1:n
    coordinates(k,1)=randomx(k);
    coordinates(k,2)=randomy(k);
    coordinates(k,3)=5;
end
return






