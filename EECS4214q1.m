fs = 100e3; % sampling frequency
dt = 1/fs;
tpast = 1e-3;% Period of the pulse
t = -tpast/2:dt:tpast/2; % Pulse Sequence
n = t/dt;
w = .1e-3; % Pulse Width
x = rectpuls(t,w);

% Plotting rectangular pulse
figure(1);
plot(t,x);
xlabel('Time');
ylabel('x(t)'); 
ylim([-0.5, 2]);
title('Rectangular Pulse time domain')

% Getting the fourier coeffiients
n1 = length(x); 
k = -(n1/2):(n1/2)-1;
c = zeros(1,length(k)); 
for i1=1:length(x)
    for i2=1:length(x)
        c(i1)=c(i1)+1/n1*x(i2)*exp(-1i*2*pi*k(i1)*n(i2)/n1);
end
end

% Plotting frequency domain
figure(2)
subplot(2, 1, 1)
stem(k,abs(c)); 
xlabel('k'); 
ylabel('Coefficients');
title('Fourier Series')
subplot(2, 1, 2)
stem(k,angle(c))
xlabel('k'); 
ylabel('Phase');
