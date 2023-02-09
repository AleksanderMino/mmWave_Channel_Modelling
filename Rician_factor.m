function[K_factor]=Rician_factor(Reference_point,Given_point,Azi_Angle)

x1=[25,36,37,40,45,40,35,35,29,25,22,22];
y1=[194,192,194,193,193,177,178,182,182,183,184,186];

x2=[9,15,18,18,16,11,7];
y2=[158,158,157,155,150,150,151];

x3=[51,59,58,83,80,53,53,47,45];
y3=[195,194,190,187,175,178,175,175,177];

x4=[48,67,65,46];
y4=[165,162,154,157];

x5=[43,64,62,41];
y5=[152,148,140,144];

x6=[35,57,56,54,49,33];
y6=[140,137,132,131,131,134];

x7=[31,37,52,52,49,43,28];
y7=[131,131,128,125,116,116,120];

x8=[20,28,42,38,36,34,13,13,14,18,18];
y8=[116,116,112,101,100,95,100,103,107,108,111];

x9=[13,17,28,30,30,28,23,10];
y9=[62,62,60,58,53,48,48,51];

x10=[113,133,131,110];
y10=[182,178,170,173];

x11=[109,129,127,107];
y11=[171,167,158,162];

x12=[104,119,120,103];
y12=[152,150,142,144];

x13=[104,115,110,99,99,102];
y13=[132,129,114,116,120,130];

x14=[102,132,132,98];
y14=[107,101,90,96];

x15=[89,111,109,85];
y15=[96,91,84,86];

x16=[84,103,102,99,99,98,82,82];
y16=[82,79,75,76,73,72,74,78];

x17=[75,91,89,73];
y17=[64,60,52,55];

x18=[65,86,83,62];
y18=[34,30,21,25];

x19=[146,158,162,162,170,167,163,152,150,146,142,143];
y19=[171,171,168,171,168,157,155,159,158,158,159,166];

x20=[118,126,121,114];
y20=[67,66,50,51];

x21=[89,92,92,97,97,96,91,89];
y21=[33,33,32,32,30,29,29,30];

x22=[104,119,121,125,125,121,119,116,118,102];
y22=[20,18,20,19,15,5,4,5,8,12];

x23=[180,196,194,191,190,188,188,185,179,174];
y23=[115,111,105,104,98,98,95,93,94,96];

x24=[171,186,178,166];
y24=[87,84,67,70];

x25=[159,166,167,177,174,170,167,153,153,157,157];
y25=[59,59,61,59,49,49,41,43,46,51,56];

x26=[135,149,147,145,132,133,135];
y26=[20,17,13,5,6,13,14];

x27=[156,168,168,165,161,152,153];
y27=[16,14,11,1,1,4,11];


% patch(x1,y1,'black');
% hold on;
% patch(x2,y2,'black');
% hold on;
% patch(x3,y3,'black');
% hold on;
% patch(x4,y4,'black');
% hold on;
% patch(x5,y5,'black');
% hold on;
% patch(x6,y6,'black');
% hold on;
% patch(x7,y7,'black');
% hold on;
% patch(x8,y8,'black');
% hold on;
% patch(x9,y9,'black');
% hold on;


slope=(Given_point(2)-Reference_point(2))/(Given_point(1)-Reference_point(1));
stepx=0.2;
n=1+abs(Given_point(1)-Reference_point(1))/stepx;
if (Azi_Angle>=0 && Azi_Angle<=90)||(Azi_Angle>=270&&Azi_Angle<=360)
    for m=1:n
        xp(m)=Reference_point(1)+(m-1)*stepx;
        yp(m)=Reference_point(2)+slope*(m-1)*stepx;
    end
else
     for m=1:n
        xp(m)=Reference_point(1)-(m-1)*stepx;
        yp(m)=Reference_point(2)-slope*(m-1)*stepx;
     end
end

Nb=0;

in = inpolygon(xp,yp,x1,y1);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x2,y2);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x3,y3);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x4,y4);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x5,y5);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x6,y6);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x7,y7);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x8,y8);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x9,y9);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x10,y10);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x11,y11);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x12,y12);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x13,y13);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x14,y14);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x15,y15);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x16,y16);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x17,y17);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x18,y18);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x19,y19);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x20,y20);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x21,y21);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x22,y22);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x23,y23);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x24,y24);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x25,y25);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x26,y26);
if numel(xp(in))>=1
    Nb=Nb+1;
end

in = inpolygon(xp,yp,x27,y27);
if numel(xp(in))>=1
    Nb=Nb+1;
end

if Nb==0
    K_factor=10;
else
    K_factor=0;
end
end











