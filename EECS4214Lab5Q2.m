alpha = 0.2; %alpha from q1
N_symbols_per_pulse = 40; %given in q1
r = 4; %given in q1
T = 0.1*exp(6); 
alpha = 0.20;
Fs = r/T;
Ts = 1/Fs;

rc = rcosdesign(alpha,N_symbols_per_pulse,r,'sqrt'); %as shown in slides
figure(1)
plot(rc)
title('Plot RC filter')
d = 2*randi([0 1], 100, 1) - 1; %Creating a vector of bipolar data.
x = upfirdn(d, rc, r); %we are upsampling and filtering data for pulse shaping
n = x + randn(size(x))*0.01; %adding noise to it
y = upfirdn(n, rc, 1, r); %Filtering again and downsampling to match the filtering


FFTsize=1024;
spec=fftshift(abs(fft(y,FFTsize)).^2);
freq=[-Fs/2:Fs/FFTsize:Fs/2];
freq=freq(1:end-1);
figure(2)
plot(freq,spec)
title('Amplitude Spectrum')
xlabel('Frequency(KHz)')
ylabel('Amplitude')
