function[gaindB]=gaindB(i,j,x)

B=[180,	180
180,	110
140	155
135	110
90	110
80	170
150	10
30	155
40	100
15	25
140	60
70	25
40	60
10  65];

cell_pt= [i,j,1.5];
bs_pt=[B(x,1),B(x,2),6];
[Tx_azi_angle, Tx_ele_angle]=Get_Angle(cell_pt, bs_pt);
[Rx_azi_angle, Rx_ele_angle]=Get_Angle(bs_pt, cell_pt);

Tx_Gain = Get_TxGain(Tx_azi_angle,Tx_ele_angle);
Rx_Gain = Get_RxGain(Rx_azi_angle,Rx_ele_angle);

gaindB=Tx_Gain+Rx_Gain;

return
end