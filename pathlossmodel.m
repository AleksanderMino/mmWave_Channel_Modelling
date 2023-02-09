function[path_loss]=pathlossmodel(d)
% ap=75.85;
% bp=3.37;
% s=8.36;
% path_loss=ap+10*bp*log10(d)+s;


% ap=24.4;
% bp=3.5;
% rp=1.9;
% s=8;

ap=11.7;
bp=2.4;
rp=2;
sigma=9.7;

path_loss=ap+10*bp*log10(d)+10*rp*log10(28)+normrnd(0,sigma);

return
end