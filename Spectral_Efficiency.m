function [se_per_user] = Spectral_Efficiency(sinr)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
se_per_user = log2(1+sinr);
end

