function [a] = ArrayResponseVector(Tx_AziAngle)
% Number of antennas
N = 4;
% array response vector
a = zeros(1,4);
for k=1:N
    if k == 1
        a(k) = 1;
    else
        a(k) = exp(-1i*(k-1)*pi*sind(Tx_AziAngle));
    end
 
end

