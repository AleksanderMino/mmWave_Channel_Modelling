function [power_vector] = Power_Allocation(no_users,base_station)

v = 0.5;
users = Random_users(no_users);

% users = [98     3     5,
%     44   165     5,
%    170     7     5,
%     91   172     5,
%    145    55     5,
%    103   163     5,
%    177    57     5,
%     62   177     5];



for k=1:length(users)
    users(k,3) = base_station;
end

received_power_dBW = zeros(1,length(users));
load('Rx_Rays.mat','Rx_Rays');

for k=1:length(users)
   received_power_dBW(k) = Rx_Rays(users(k,1),users(k,2),users(k,3)).TotalPower_dBm - 30;
   
end

received_power_linear = 10.^(received_power_dBW/10);
received_power_linear_constant = received_power_linear.^v;
sum_received_power_constant = 0;

for n=1:length(users)
    sum_received_power_constant = sum_received_power_constant + received_power_linear(n)^v;
end

power_vector = received_power_linear_constant./sum_received_power_constant;
