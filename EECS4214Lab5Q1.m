% EECS 4214 Lab5 q1

% Parameters 
SNR = 0:1:20;
T = 0.1*exp(6); 
r = 4;
Nsymbols = 40;
alpha = 0.20;
Fs = r/T;
Ts = 1/Fs;
Nsymb = 10000;
M = 16;

% a)
qam_axis = -sqrt(M)+1:2:sqrt(M);
% b)
alphabet = bsxfun(@plus, qam_axis', 1j*qam_axis);
alphabet = alphabet(:)';
% c)
scale_factor = 1./sqrt(mean(abs(alphabet).^2));
alphabet = alphabet.*scale_factor;
% d and e)
N_data_symbols = alphabet(randi(length(alphabet), 1, Nsymb));
% f) 
plot(N_data_symbols,'ro')
grid on;
xlabel('Re');
ylabel('Im');
title('Transmitted Symbols')

