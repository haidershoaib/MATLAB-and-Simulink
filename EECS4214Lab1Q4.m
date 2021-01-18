% Lab 1 Q4 %
t = 0:0.000999:1;
f1 = 10000000;
X = sin((pi*2*f1)*t) + (1/3)*sin(pi*2*(3*f1)*t) + (1/5)*sin(pi*2*(5*f1)*t);

L = length(t);
n = 2^nextpow2(L);

Y = fft(X, n);
Y1 = f1*(0:(n/2))/n;
P = abs(Y/n);

figure(1)
subplot(2,1,1) 
plot(t, X);
xlim([0 2]);
title('Time Domain');
xlabel('Time');
ylabel('Amplitude');

subplot(2,1,2) 
plot(Y1, P(1:n/2+1)); 
title('Frequency Domain');
ylabel('Amplitude');
xlabel('Frequency');