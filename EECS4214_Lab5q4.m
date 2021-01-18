%Define Variables 

omega = 5:5:35;
gamma_out = 1;

H1 = 30000; %Can be 20, 10, or 5
L = 5000;
T = 10 * 1000;
K = 0.316228;
p = 50;

sigma_squared = 0.000630957;
PS = 20; %20 dB 
lambda = PS./(sigma_squared);

m = 2;
b = 10; %10 dB
alpha = ((2.*b.*m)./(2.*b.*m + omega)).^m;
beta = (1./(2.*b));
delta = omega./(2.*b.*(2.*b.*m + omega));
delta_tri = ((beta - delta)./lambda).*gamma_out;


U1 = 8371000;
U2 = 6531000;
RE = 6371000;
HR = H1 + RE;
RS = 7000000; %Arbritary Value between U1 and U2

phi = pi./3; %Value defined in section b

d0_min = U2 - HR;
d0_max = (U1.^2 + HR.^2 - 2.*U1.*HR.*cos(phi./2)).^0.5;
b1 = (d0_max.^2 - d0_min.^2)./2;
b2 = (d0_max.^2 + d0_min.^2)./2;
tau = (3./HR).*(1./(1-cos(phi./2))).*(1./(U1.^3 - U2.^3));

%Define Equation for Pout_SR (Equation 29) 

summation_1 = 0;

y = marcumq(sqrt(2*K),sqrt((2*(1+K)*(5))./(omega)));

plot(omega,y, '*-');
title("Coverage Probability (Non-Interference Scenario)");
xlabel("Omega_R (dB)");
ylabel("Coverage Probability")