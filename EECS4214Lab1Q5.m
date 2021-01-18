% Lab 1 Q4 %
t = 0:0.000999:1;
f1 = 1000;
x1 = sin((pi*2*f1)*t) + (1/3)*sin(pi*2*(3*f1)*t) + (1/5)*sin(pi*2*(5*f1)*t);
n = randn(size(t));
X = x1 + n;
L = length(t);
n = 2^nextpow2(L);

Y = fft(X, n);
Y1 = f1*(0:(n/2))/n;
P = abs(Y/n);

N = length(X);
y = fft(X);
y = y(1:N/2+1);
y1 = (1/(f1*N)) * abs(y).^2;
y1(2:end-1) = 2*y1(2:end-1);
f = 0:f1/length(X):f1/2;


figure(1)
subplot(2,1,1) 
plot(t, X);
grid on
xlim([0 2]);
title('Time Domain');
xlabel('Time');
ylabel('Amplitude');

subplot(2,1,2) 
plot(Y1, P(1:n/2+1)); 
grid on
title('Frequency Domain');
ylabel('Amplitude');
xlabel('Frequency');

figure(2)
subplot(2,1,1)
periodogram(X,rectwin(length(X)),length(X),f1)
title('Periodogram Method')
xlabel('Frequency')
ylabel('Power')

subplot(2,1,2) 
plot(f,10*log10(y1))
title('Periodogram using FFT')
xlabel('Frequency')
ylabel('Power')
grid on


