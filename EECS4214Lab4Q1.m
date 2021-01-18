n = randi([0 1],1,30);
fs = 1600;
Ts = 1/fs;
N0 = 3000;
figure(1);
[t,x] = prz(n,Ts);
N=2^16; %Number of discrete points in the FFT.)
y=fft(x,N)/fs; %fft of noise
z=fftshift(y);%center noise spectrum
f_vec=[0:1:N-1]*fs/N-fs/2; %designate sample frequencies
amplitude_spectrum=abs(z); %compute two-sided amplitude spectrum
ESD1=amplitude_spectrum.^2; %ESD = |F(w)|^2;
PSD1=ESD1/((N0-1)*Ts);% PSD=ESD/T where T = total time of sample
plot(f_vec,10*log10(PSD1));
xlabel('Frequency [Hz]','fontsize',14)
ylabel('dB/Hz','fontsize',14)
title('Power spectral density Polar RZ')
grid on


figure(2);
[t,x] = urz(n,Ts);
N=2^16; %Number of discrete points in the FFT.)
y=fft(x,N)/fs; %fft of noise
z=fftshift(y);%center noise spectrum
f_vec=[0:1:N-1]*fs/N-fs/2; %designate sample frequencies
amplitude_spectrum=abs(z); %compute two-sided amplitude spectrum
ESD1=amplitude_spectrum.^2; %ESD = |F(w)|^2;
PSD1=ESD1/((N0-1)*Ts);% PSD=ESD/T where T = total time of sample
plot(f_vec,10*log10(PSD1));
xlabel('Frequency [Hz]','fontsize',14)
ylabel('dB/Hz','fontsize',14)
title('Power spectral density UniPolar RZ')
grid on


figure(3);
[t,x] = unrz(n,Ts);
N=2^16; %Number of discrete points in the FFT.)
y=fft(x,N)/fs; %fft of noise
z=fftshift(y);%center noise spectrum
f_vec=[0:1:N-1]*fs/N-fs/2; %designate sample frequencies
amplitude_spectrum=abs(z); %compute two-sided amplitude spectrum
ESD1=amplitude_spectrum.^2; %ESD = |F(w)|^2;
PSD1=ESD1/((N0-1)*Ts);% PSD=ESD/T where T = total time of sample
plot(f_vec,10*log10(PSD1));
xlabel('Frequency [Hz]','fontsize',14)
ylabel('dB/Hz','fontsize',14)
title('Power spectral density UniPolar NRZ')
grid on


figure(4);
[t,x] = manchester(n,Ts);
N=2^16; %Number of discrete points in the FFT.)
y=fft(x,N)/fs; %fft of noise
z=fftshift(y);%center noise spectrum
f_vec=[0:1:N-1]*fs/N-fs/2; %designate sample frequencies
amplitude_spectrum=abs(z); %compute two-sided amplitude spectrum
ESD1=amplitude_spectrum.^2; %ESD = |F(w)|^2;
PSD1=ESD1/((N0-1)*Ts);% PSD=ESD/T where T = total time of sample
plot(f_vec,10*log10(PSD1));
xlabel('Frequency [Hz]','fontsize',14)
ylabel('dB/Hz','fontsize',14)
title('Power spectral density Manchester')
grid on



function [t,x] = prz(bits, bitrate)

T = length(bits)/bitrate; % full time of bit sequence
t = 0:0.001:T;
x = zeros(1,length(t)); % output signal

for i = 0:length(bits)-1
  if bits(i+1) == 1
    x(i*1000+1:(i+0.5)*1000) = 1;
    x((i+0.5)*1000+1:(i+1)*1000) = 0;
  else
    x(i*1000+1:(i+0.5)*1000) = -1;
    x((i+0.5)*1000+1:(i+1)*1000) = 0;
  end
end
end

function [t,x] = urz(bits, bitrate)

T = length(bits)/bitrate; % full time of bit sequence
t = 0:0.001:T;
x = zeros(1,length(t)); % output signal

for i = 0:length(bits)-1
  if bits(i+1) == 1
    x(i*1000+1:(i+0.5)*1000) = 1;
  else
    x(i*1000+1:(i+1)*1000) = 0;
  end
end
end

function [t,x] = unrz(bits, bitrate)

T = length(bits)/bitrate; % full time of bit sequence
t = 0:0.001:T;
x = zeros(1,length(t)); % output signal

for i = 0:length(bits)-1
  if bits(i+1) == 1
    x(i*1000+1:(i+1)*1000) = 1;
  else
    x(i*1000+1:(i+1)*1000) = 0;
  end
end
end
function [t,x] = manchester(bits, bitrate)

T = length(bits)/bitrate; % full time of bit sequence
t = 0:0.001:T;
x = zeros(1,length(t)); % output signal

for i = 0:length(bits)-1
  if bits(i+1) == 1
   x(i*1000+1:(i+0.5)*1000) = 1;
    x((i+0.5)*1000+1:(i+1)*1000) = -1;
  else
    x(i*1000+1:(i+0.5)*1000) = -1;
    x((i+0.5)*1000+1:(i+1)*1000) = 1;
  end
end
end
