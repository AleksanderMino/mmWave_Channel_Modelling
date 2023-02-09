function [channel_coeff] = Channel_Coeffients(x_y_coord)

if nargin > 0
    coordinates = x_y_coord;
else
    coordinates = [110,110,4];
end


% Running through all SimulationRecord.mat files from all BS folders
% Saving values of the number of rays and their power to variable Rx_Rays
Rx_Rays = struct([]);
max_num_angles = 3;
Tx_AziAngles_Combined = zeros(180,180);

if ~(isfile('Rx_Rays.mat') && isfile('Tx_AziAngles_Combined.mat'))
    
    total_BS_object = matfile('BS_LocId.mat');
    total_BS_number = size(total_BS_object,'BS_LocId',1);

    load('BS_LocId.mat');

    for i = 1:total_BS_number
        cd(sprintf('%d',BS_LocId(i,:)));
        load('SimulationRecord.mat', 'Receiver_Ray');
        load('TxRx_Angles.mat', 'Tx_AziAngle');
   
        for n = 11:190
            for k = 11:190
                Rx_Rays((n-10),(k-10),i).Ray_Count = Receiver_Ray(n,k).Ray_Count;
                Rx_Rays((n-10),(k-10),i).Power_dBm = Receiver_Ray(n,k).Power_dBm;
            end
        end 
 
        for m = 1:max_num_angles
            for n = 11:190
                for k = 11:190
                    Tx_AziAngles_Combined((n-10),(k-10),m,i) = Tx_AziAngle(n,k,m);
                end
            end 
        end
        cd ..
    
    end

    save Rx_Rays.mat Rx_Rays
    save Tx_AziAngles_Combined.mat Tx_AziAngles_Combined
else
%{
freq = 28e9; c = 3e8; l = c/freq; d = 0.5*l;
%}
load('Rx_Rays.mat');
load('Tx_AziAngles_Combined.mat');

% array_resp_vector = [];
if Rx_Rays(coordinates(1),coordinates(2),coordinates(3)).Ray_Count == 1
    
    array_resp_vector = ArrayResponseVector(Tx_AziAngles_Combined(coordinates(1),coordinates(2),1,coordinates(3)));
    y = unifrnd(0,2*pi);
    Power_ray_dBW = Rx_Rays(coordinates(1),coordinates(2),coordinates(3)).Power_dBm - 30;
    Power_ray_linear = 10.^(Power_ray_dBW/10);
    gain_path = sqrt(Power_ray_linear);
    channel_coeff = gain_path*exp(-1i*y)*array_resp_vector; 
    fprintf('1 ray!! \n');

elseif Rx_Rays(coordinates(1),coordinates(2),coordinates(3)).Ray_Count > 1
    
  channel_coeff = zeros(1,4);
    for k = 1:Rx_Rays(coordinates(1),coordinates(2),coordinates(3)).Ray_Count 
        y = unifrnd(0,2*pi);
        array_resp_vector = ArrayResponseVector(Tx_AziAngles_Combined(coordinates(1),coordinates(2),k,coordinates(3)));
        Power_ray_dBW = Rx_Rays(coordinates(1),coordinates(2),coordinates(3)).Power_dBm(k) - 30;
        Power_ray_linear = 10^(Power_ray_dBW/10);
        gain_path = sqrt(Power_ray_linear);
        channel_coeff_per_ray = gain_path*exp(-1i*y)*array_resp_vector; 
        channel_coeff = channel_coeff + channel_coeff_per_ray; 
        fprintf('%d iteration!! \n',k);
    end
    
    
%{
    array_resp_vector(1) = 1;
    array_resp_vector(2) = exp(-i*pi*sin(Rx_AziAngles_Combined(coordinates(1),coordinates(2),2,coordinates(3))));
   
elseif Rx_Rays(coordinates(1),coordinates(2),coordinates(3)).Ray_Count == 3
    array_resp_vector(1) = 1;
    array_resp_vector(2) = exp(-i*2*pi*sin(Rx_AziAngles_Combined(coordinates(1),coordinates(2),2,coordinates(3))));
    array_resp_vector(2) = exp(-i*2*pi*sin(Rx_AziAngles_Combined(coordinates(1),coordinates(2),3,coordinates(3))));
%}
else
    channel_coeff = -Inf
end
end
end




