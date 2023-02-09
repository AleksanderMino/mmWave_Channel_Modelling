function [mrc_vector] = Precoder_MR(users,no_users,base_station, channel_coeff_users,power_vector)

for k=1:no_users
    users(k,3) = base_station;
end

% channel_coeff_users = zeros(4,length(users));
% 
% for k=1:length(users)
%     channel_coeff_users(1:4,k) = Channel_Coeffients([users(k,1),users(k,2),users(k,3)]);
% end


mrc_vector = zeros(4,no_users);

for k=1:no_users
  
   if norm(channel_coeff_users(1:4,k))==0
        mrc_vector(1:4,k) = 0;
   else
        mrc_vector(1:4,k) = channel_coeff_users(1:4,k) / norm(channel_coeff_users(1:4,k));
   end
end
  
mrc_vector = mrc_vector .* sqrt(power_vector);
end

