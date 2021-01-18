% Lab 1 Q3 %

% Convert a Gaussian pulse from time domain to the frequency domain?
% Plot the FFT of the Gaussian pulse.

% Time Vector
sampFreq = 100;
t = -0.5:1/sampFreq:0.5;

mean = 0;
var = 0.01;

% Gaussian pulse formula
gPulse = 1/(4*sqrt(2*pi*var))*(exp(-t.^2/(2*var)));

% Plotting time domain
subplot(2,1,1) 
plot(t, gPulse);
xlim([-1 1]);
xlabel('Time');
ylabel('Magnitude');
title('Gaussian Pulse in Time Domain')

% Freq domain
L = length(t);
n = 2^nextpow2(L);
Y = fft(gPulse, n);

% Frequency domain calculation
gPulse_freq = sampFreq*(0:(n/2))/n;
P = abs(Y/n);

% Plotting frequency domain
subplot(2,1,2) 
plot(gPulse_freq, P(1:n/2+1)) 
title('Gaussian Pulse in Frequency Domain')
xlabel('Frequency');
ylabel('Magnitude');