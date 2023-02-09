function [sinr_vector_mrc,sinr_vector_dB_mrc,sinr_vector_rzf,sinr_vector_dB_rzf,se_vector_mrc,se_vector_rzf] = Stochastic_SINR_and_SE(no_users)

users = Random_users(no_users);
no_base_stations = 14;

noise_figure_dB =7; 
k=1.38*10^(-23);
T = 290;
B = 500*10^6;
thermal_noise_dB = 10*log10(k*T*B);
total_noise_dB = noise_figure_dB + thermal_noise_dB;
total_noise_linear = 10^(total_noise_dB/10);
p_matrix=zeros(no_base_stations,no_users);

channel_coeff= zeros(4,no_base_stations,no_users);
for m=1:no_users
    for k=1:no_base_stations
        [power,RicianCoeff] = RicianCoefficients(users(m,1),users(m,2),k);
        channel_coeff(1:4,k,m)=RicianCoeff;
        p_matrix(k,m)=power;
    end
end
power_matrix = Power_Allocation_S(no_users,no_base_stations,p_matrix);

precoding_vectors_rzf = zeros(4,no_users,no_base_stations);
precoding_vectors_mrc = zeros(4,no_users,no_base_stations);

for k=1:no_base_stations
   precoding_vectors_rzf(:,:,k) = Precoder_RZF(users,no_users,k, channel_coeff(:,k,:),power_matrix(k,:));
   precoding_vectors_mrc(:,:,k) = Precoder_MR(users,no_users,k,channel_coeff(:,k,:),power_matrix(k,:));
end



[sinr_vector_mrc, sinr_vector_dB_mrc] = Sinr_Calculation(channel_coeff,precoding_vectors_mrc,total_noise_linear,no_users, no_base_stations);
[sinr_vector_rzf, sinr_vector_dB_rzf] = Sinr_Calculation(channel_coeff,precoding_vectors_rzf, total_noise_linear,no_users, no_base_stations);

se_vector_mrc = Spectral_Efficiency(sinr_vector_mrc);
se_vector_rzf = Spectral_Efficiency(sinr_vector_rzf);

end