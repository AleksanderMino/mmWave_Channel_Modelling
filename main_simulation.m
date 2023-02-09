start = datetime('now')

N = 5; % Number of running the simulation
no_users = 5; % Number of users per simulation

for k = 1:N
    [sinr_mr,sinr_mr_dB,sinr_rzf,sinr_rzf_dB,se_mr,se_rzf] = main_sinr_se(no_users)
end

endtime = datetime('now')