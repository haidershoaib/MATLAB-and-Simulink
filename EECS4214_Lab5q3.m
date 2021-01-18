N_symbols_per_pulse = 40; %given in q1
alpha = 0.2; %alpha from q1
r = 4; %given in q1
SNR = 0:1:179; %given in q1
T = 0.1*exp(6); %given in q1
Fs = r/T;%given in q1
Ts = 1/Fs;%given in q1



%question 2
rc = rcosdesign(alpha,N_symbols_per_pulse,r,'sqrt'); %as shown in slides
d = 2*randi([0 1], 100, 1) - 1; %Creating a vector of bipolar data.
x = upfirdn(d, rc, r); %we are upsampling and filtering data for pulse shaping
n = x + randn(size(x))*0.01; %adding noise to it
sig = upfirdn(n, rc, 1, r); %Filtering again and downsampling to match the filtering

N = size(sig,1);

noise = 1/sqrt(2)*(randn(1,N)+1i*randn(1,N));

P_n = var(noise);
P_S = var(sig);

NSF = sqrt(P_S/P_n./10.^(SNR./10).*(r/(1+alpha)));

final = noise .* NSF + sig;

FFTsize=1024;
spec=fftshift(abs(fft(final,FFTsize)).^2);
freq=[-Fs/2:Fs/FFTsize:Fs/2];
freq=freq(1:end-1);
figure(1)
plot(freq,spec)
title('Amplitude Spectrum of Noisy Bandpass Signal')
xlabel('Frequency(KHz)')
ylabel('Amplitude Spectrum')

spec2=fftshift(abs(fft(noise,FFTsize)).^2);
freq2=[-Fs/2:Fs/FFTsize:Fs/2];
freq2=freq2(1:end-1);
figure(2)
plot(freq2,spec2)
title('Amplitude Spectrum of Noise')
xlabel('Frequency(KHz)')
ylabel('Amplitude Spectrum')
