function[power,RicianCoeff]=RicianCoefficients(x,y,n)

B=[190	190;
190	120;
150	165;
145	120;
100	120;
90	180;
160	20;
40	165;
50	110;
25	35;
150	70;
80	35;
50	70;
20	75];

Given_Pt=[x,y];
Reference_Pt=B(n,1:2);
Reference_Pt_x=B(n,1);
Reference_Pt_y=B(n,2);
Ref_x=Given_Pt(1)-Reference_Pt_x;
Ref_y=Given_Pt(2)-Reference_Pt_y;

Azi_Angle = atan2d(Ref_x,Ref_y);
Azi_Angle(Azi_Angle < 0) = 360 + Azi_Angle(Azi_Angle < 0);

%[Azi_Angle, Ele_Angle] = Get_Angle(Reference_Pt, Given_Pt);

aziangle=Azi_Angle*pi/180;


 p=10^((30-pathloss2(x,y,n))/10);
        gain=10^(6/10);
        power=p*gain;
N = 4;

K=Rician_factor(Reference_Pt,Given_Pt,Azi_Angle);
%K = 5;

s =sqrt(K/(K+1))*exp(1j*aziangle);  
%s =sqrt(K/(K+1))*exp(1j*rand()*2*pi); 
sigma = 1/(2*sqrt((K+1))); %variance
beta = power;
  % Rician fading coefficients 
        ricianchan = ((sigma*randn(1,N)+s) + 1j*(sigma*randn(1,N)));
        RicianCoeff = ricianchan*sqrt(beta);
                
end