% Lab 2 q7
Fs = 1000;
t = (0:.1:10)'; 
x = sin(t);
y = awgn(x,10,'measured');
% Plot histogram of noise
subplot (3,2,1);
histogram(y)
grid on
title('Histogram of Noise')
ylabel('AWGN')
xlabel('t')

% Plot noisy sinusoid
subplot (3,2,2);
plot(t,[x y])
title('Noisy Sinusoid')
ylabel('Amplitude')
xlabel('t')

% Plot Periodogram
N = length(y);
xdft = fft(y);
xdft = xdft(1:N/2+1);
psdx = (1/(Fs*N)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);
freq = 0:Fs/length(x):Fs/2;
pxx = periodogram(y);
subplot (3,2,3);
plot(pxx)
grid on;
title('Periodogram Using FFT')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')
xlim([0 40])

% Plot Autocorrelation
subplot (3,2,4);
autocorr(psdx)
grid on
title('Autocorrelation Plot')
xlabel('Frequency')
ylabel('Power/Frequency (dB/Hz)')

subplot (3,2,5);
xdft = fft(y);
xdft = xdft(1:length(x)/2+1);
freq1 = 0:Fs/length(x):Fs/2;
plot(freq1,abs(xdft));
grid on;
title('Amplitude Spectrum');
ylabel('Amplitude');
xlabel('Hz');

% Average PSD of noise
avg1 = mean(pxx)
% Average value of noise
avg2 = mean(y)
