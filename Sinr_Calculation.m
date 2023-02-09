function [sinr_per_user, sinr_per_user_dB]= Sinr_Calculation(channel_coeff,precoding_vectors, total_noise_linear,no_users, no_base_stations)
% start = datetime('now')
% no_base_stations = 14;
% 
% noise_figure_dB = 5;
% noise_figure_linear = 10^(noise_figure_dB/10);
% 
% users = Random_users(no_users);
% channel_coeff= zeros(4,no_base_stations,no_users);
% 
% for m=1:no_users
%     for k=1:no_base_stations
%         channel_coeff(1:4,k,m) = Channel_Coeffients([users(m,1),users(m,2),k]);
%     end
% end
% 
% precoding_vectors = zeros(4,no_users,no_base_stations);
% 
% for k=1:no_base_stations
%    precoding_vectors(:,:,k) = Precoder_RZF(users,k);
% end

sinr_per_user = zeros(1,no_users);
sum_desired_signal_per_user = zeros(1,no_users);
sum_interference_per_user = zeros(1,no_users,no_users);
sum_interference_per_user_total = zeros(1,no_users);

for m=1:no_users

     for k=1:no_base_stations
        sum_desired_signal_per_user(1,m) = sum_desired_signal_per_user(1,m) + ctranspose(channel_coeff(1:4,k,m))*precoding_vectors(1:4,m,k);
     end
     sum_desired_signal_per_user(1,m) = (abs(sum_desired_signal_per_user(1,m)))^2;

  for n=1:no_users
   if n~=m  
       for k=1:no_base_stations
            sum_interference_per_user(1,n,m) = sum_interference_per_user(1,n,m) + ctranspose(channel_coeff(1:4,k,m))*precoding_vectors(1:4,n,k);
       end
       sum_interference_per_user(1,n,m) = (abs(sum_interference_per_user(1,n,m)))^2;
   end
  end
end

for m=1:no_users
    for n=1:no_users
        sum_interference_per_user_total(1,m) = sum_interference_per_user_total(1,m) + sum_interference_per_user(1,n,m);
    end
end

for m=1:no_users
    sinr_per_user(1,m) = sum_desired_signal_per_user(1,m)/(sum_interference_per_user_total(1,m)+total_noise_linear);
end

sinr_per_user_dB = 10*log10(sinr_per_user);
end