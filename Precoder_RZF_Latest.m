function [rzf_vector] = Precoder_RZF_Latest(users,base_station,channel_coeff_users,a)
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
for k=1:size(users,1)
    users(k,3) = base_station;
end
    
% channel_coeff_users = zeros(4,length(users));
% 
% for k=1:size(users,1)
%     channel_coeff_users(1:4,k) = Channel_Coeffients([users(k,1),users(k,2),users(k,3)],a,b);
% end

power_vector = Power_Allocation(users,base_station,a);


noise_figure_dB = 5;
k = physconst('Boltzmann');
T = 290;
B = 500*10^6;

thermal_noise_dB = 10*log10(k*T*B);
total_noise_dB = noise_figure_dB + thermal_noise_dB;
total_noise_linear = 10^(total_noise_dB/10);

sum_rzf = zeros(4,4,size(users,1));
rzf_vector = zeros(4,size(users,1));
sum_rzf_noise = zeros(4,4,size(users,1));
sum_rzf_noise_inv = zeros(4,4,size(users,1));
vector = zeros(4,size(users,1));
b = zeros(4,size(users,1));


for k=1:size(users,1)
    for m=1:size(users,1)
        if k~=m 
            sum_rzf(:,:,k) = sum_rzf(:,:,k) + channel_coeff_users(1:4,m)*ctranspose(channel_coeff_users(1:4,m));
        end
    end
    
    if all(sum_rzf(:,:,k)==0)
        rzf_vector(1:4,k) = 0;
    
    else

        sum_rzf_noise(:,:,k) = sum_rzf(:,:,k) + total_noise_linear;
        sum_rzf_noise_inv(:,:,k) = inv(sum_rzf_noise(:,:,k));
    
    end    
    
   vector(1:4,k) = sum_rzf_noise_inv(:,:,k)*channel_coeff_users(1:4,k);
   if isnan(norm(vector(1:4),k)) || norm(vector(1:4,k))==0
       rzf_vector(1:4,k) = 0;
%    end
%    if norm(vector(1:4,k))==0
%         rzf_vector(1:4,k) = 0;
   else
%         b = norm(vector(1:4,k));
        rzf_vector(1:4,k) = sqrt(power_vector(k))*vector(1:4,k) / norm(vector(1:4,k));
   end
end

end


    
    
% for k=1:size(users,1)
%    vector(1:4,k) = sum_rzf_noise_inv(:,:,k)*power_vector(k)*channel_coeff_users(1:4,k);
%    if isnan(norm(vector(1:4),k)) || norm(vector(1:4,k))==0
%        rzf_vector(1:4,k) = 0;
% %    end
% %    if norm(vector(1:4,k))==0
% %         rzf_vector(1:4,k) = 0;
%    else
%         b = norm(vector(1:4,k));
%         rzf_vector(1:4,k) = sqrt(power_vector(k))*vector(1:4,k) / norm(vector(1:4,k));
%    end
% end



