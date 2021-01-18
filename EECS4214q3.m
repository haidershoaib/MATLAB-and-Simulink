EbNodB = -5:2:20;
bit_number=1e6;                              
 
for n=1:length(EbNodB)
    % Using 2*Data - 1 as the easiest method
    s = 2*(randn(1,bit_number)>0.5)-1;
    % AWGN with zero variance, real values only
    w = (1/sqrt(2*10^(EbNodB(n)/10)))*randn(1,bit_number); 
    theoBER = 0.5*erfc(sqrt(10^(EbNodB(n)/10))); 
    % Rayleigh
    ray = (1/sqrt(2*10^(EbNodB(n)/10)))*randn(1,bit_number);
    y = ray.*s + 10^(-EbNodB(n)/20)*w; 
    eq = y./ray;
    demod_y = sign(eq);
    % Signal with AWGN channel
    r = s + w;
    % Demodulate signal
    demod_r = sign(r);  
    % BER calculation
    BER(n) = (bit_number - sum(s == demod_r))/bit_number; 
    BER_r(n) = (bit_number - sum(s == demod_y))/bit_number;            

end

% Plot BER in terms of 10*log10
figure(1)
subplot(2, 1, 1)
semilogy(EbNodB, BER,'o-');                 
xlabel('EbNo(dB)')                         
ylabel('BER')
title('BER Plot AWGN')
grid on

subplot(2, 1, 2)
semilogy(EbNodB, theoBER,'o-');                 
xlabel('EbNo(dB)')                         
ylabel('BER')
title('Theoretical BER Plot AWGN')
grid on

figure(2)
semilogy(EbNodB, BER_r,'o-');                 
xlabel('EbNo(dB)')                         
ylabel('BER')
title('BER Plot Rayleigh')
grid on
