% Lab 3 q1
f1 = 10000; 
f2 = 11000;
dt1 = 1/f1;
dt2 = 1/f2;
t1 = 0:dt1:100;
t2 = 0:dt2:100;
s1 = sin(400*pi*t1) + 0.5*cos(12000*pi*t1);
s2 = sin(400*pi*t2) + 0.5*cos(12000*pi*t2);

FFTsize=1024;
freq_spectrum = fftshift(abs(fft(s1,FFTsize)).^2);
freq_spectrum_2 = fftshift(abs(fft(s2,FFTsize)).^2);

freq = -f1/2:f1/FFTsize:f1/2;
freq_2 = -f2/2:f2/FFTsize:f2/2;

freq = freq(1:end-1);
freq_2 = freq_2(1:end-1);

figure(1)
plot(freq,freq_spectrum)
title('Sampled at 10KHz')
xlabel('Frequency(Hz)')
ylabel('Amplitude Spectrum')

figure(2)
plot(freq_2,freq_spectrum_2)
title('Sampled at 11KHz')

xlabel('Frequency(Hz)')
ylabel('Amplitude Spectrum')