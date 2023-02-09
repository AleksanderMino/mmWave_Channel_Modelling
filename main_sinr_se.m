function [sinr_vector_mrc,sinr_vector_dB_mrc,sinr_vector_rzf,sinr_vector_dB_rzf,se_vector_mrc,se_vector_rzf] = main_sinr_se(no_users)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% start = datetime('now')
no_base_stations = 14;

noise_figure_dB = 5; 
% noise_figure_linear = 10^(noise_figure_dB/10);
k = physconst('Boltzmann');
T = 290;
B = 28*10^9;

thermal_noise_dB = 10*log10(k*T*B);
total_noise_dB = noise_figure_dB + thermal_noise_dB;
total_noise_linear = 10^(total_noise_dB/10);



users = Random_users(no_users);
channel_coeff= zeros(4,no_base_stations,no_users);

M = 4;

for m=1:no_users
    for k=1:no_base_stations
        channel_coeff(1:4,k,m) = Channel_Coeffients([users(m,1),users(m,2),k]);
    end
end

precoding_vectors_rzf = zeros(4,no_users,no_base_stations);
precoding_vectors_mrc = zeros(4,no_users,no_base_stations);

for k=1:no_base_stations
   precoding_vectors_rzf(:,:,k) = Precoder_RZF(users,k, channel_coeff(:,k,:));
   precoding_vectors_mrc(:,:,k) = Precoder_MR(users,k,channel_coeff(:,k,:));
end

[sinr_vector_mrc, sinr_vector_dB_mrc] = Sinr_Calculation(channel_coeff,precoding_vectors_mrc,total_noise_linear,no_users, no_base_stations);
[sinr_vector_rzf, sinr_vector_dB_rzf] = Sinr_Calculation(channel_coeff,precoding_vectors_rzf, total_noise_linear,no_users, no_base_stations);

se_vector_mrc = Spectral_Efficiency(sinr_vector_mrc);
se_vector_rzf = Spectral_Efficiency(sinr_vector_rzf);

% endtime = datetime('now')
end
