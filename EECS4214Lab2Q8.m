% Lab 2 q8
a = 0.9;
Fs = 1000;
var = 1;
L = 50;
Fc = 10;
t = (0:.1:10)'; 
rng default
x = rand(L,1);
[c,lags] = xcov(x);
figure(1)
stem(lags,c)
title('Auto Covariance Plot')


S = 5*sin(2*pi*Fc*t);
S_wnoise = S + 1*randn(size(S));
figure(1)
plot(t,S_wnoise)
title('White Gaussian Noise Plot')
rng default
x = rand(L,1);
[c,lags] = xcov(S_wnoise, 50, 'biased');
figure(2)
stem(lags,c)
title('White Gaussian Noise Covariance Plot')

yn = fft(S_wnoise);
N = length(S_wnoise);
f = [-N/2:N/2-1]/N;
figure(3)
plot(f,yn)
title('Gaussian Noise Frequency Plot')
