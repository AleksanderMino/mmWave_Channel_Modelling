function [power_matrix] = Power_Allocation_S(no_users,no_BS,p_matrix)
% gain=10^(6/10);
v = 0.5;
p=zeros(1,no_users);
power_matrix=zeros(no_BS,no_users);

for m=1:no_BS
for k=1:no_users
    p(k)=p_matrix(m,k);
end

received_power_linear_constant = p.^v;
sum_received_power_constant = 0;

for n=1:no_users
    sum_received_power_constant = sum_received_power_constant + p(n)^v;
end
power_matrix(m,1:no_users) = received_power_linear_constant./sum_received_power_constant;
end