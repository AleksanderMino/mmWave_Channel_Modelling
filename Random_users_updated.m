function[coordinates]=Random_users_updated(n)


I=imread("C:\Users\aksha\Documents\MWC\Diff_Building1.jpg");   
I = rgb2gray(I);     


a=180; 
b=180; 
c=1;
l=1;    
M = imresize(I,[a/l b/l]);
J=floor(M/255);

R=rand(180);

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


figure(6)
axes('GridLineStyle', '-'); 
hold on 
grid on
axis([0,a,0,b]); 
set(gca,'xtick',0:1:a,'ytick',0:1:b); 



J1=double(J);
R1=double(R);


P=J1.*R1;

P1=reshape(P,[1,32400]);

[randommax, randomnumber]=sort(P1,"descend");

randomx=zeros(1,n);
randomy=zeros(1,n);


for k=1:n

    randomx(k)=ceil(randomnumber(k)/180);
    y=mod(randomnumber(k),180);
    if y==0
        randomy(k)=1;
    else
        randomy(k)=181-y;
    end

end


for i=1:a/l
    for j=1:b/l

        if(J(i,j)==0)
             y=[180-i,180-i,181-i,181-i]*l; 
            x=[j-1,j,j,j-1]*l;   
            h=fill(x,y,'black'); 
        end
    end
end

hold on
plot(randomx-0.5,randomy-0.5,'p','Color','blue','MarkerSize',7)

hold on
plot(BSX-0.5,BSY-0.5,'^','Color','red','MarkerSize',5)
xlabel('Location x in meters')
ylabel('Location y in meters')
title('Random Generated Users （The blue five-pointed star is the user, and the red triangle is the base station.）')


coordinates=zeros(n,2);
for k=1:n
    coordinates(k,1)=randomx(k);
    coordinates(k,2)=randomy(k);
end
return





