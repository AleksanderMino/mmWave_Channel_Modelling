function [rzf_vector] = Precoder_RZF(users,no_users,base_station, channel_coeff_users,power_vector)
% that we want to be generated
%  
% users = [     94   162,
%    166    78,
%    168   174,
%    160     4,
%     71    44
% 
%     ];
% 
% users = Random_users(no_users);
for k=1:no_users
    users(k,3) = base_station;
end
%     
% channel_coeff_users = zeros(4,length(users));
% 
% for k=1:length(users)
%     channel_coeff_users(1:4,k) = Channel_Coeffients([users(k,1),users(k,2),users(k,3)]);
% end

noise_figure_dB =7; 
k=1.38*10^(-23);
T = 290;
B = 2*10^9;
thermal_noise_dB = 10*log10(k*T*B);
total_noise_dB = noise_figure_dB + thermal_noise_dB;
total_noise_linear = 10^(total_noise_dB/10);


% noise_dB = 5;
% noise_linear = 10^(noise_dB/10);
sum_rzf = 0;

for k=1:no_users
    sum_rzf = sum_rzf + sqrt(power_vector(k))*channel_coeff_users(1:4,k)*ctranspose(channel_coeff_users(1:4,k));
end
if sum_rzf == 0
    rzf_vector = zeros(4,no_users);
else
    sum_rzf_noise = sum_rzf + total_noise_linear;
    sum_rzf_noise_inv = inv(sum_rzf_noise);
    
    vector = zeros(4,no_users);
    rzf_vector = zeros(4,no_users);
    
    
for k=1:no_users
   vector(1:4,k) = sum_rzf_noise_inv*channel_coeff_users(1:4,k);
   if norm(vector(1:4,k))==0
        rzf_vector(1:4,k) = 0;
   else
        rzf_vector(1:4,k) = vector(1:4,k)*sqrt(power_vector(k)) / norm(vector(1:4,k));
        
   end
end

end
