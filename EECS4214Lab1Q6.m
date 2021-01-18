% EECS4214 Lab1 q6 %

% a) Generate sequence of bits with 80% of the time being 1's
data = rand(1,10000000)>.2;

% b) Modulate bits. 0-> -1, 1 -> 1 
temp = zeros(size(data));
for i = 1:length(data)
    if data(i) == 1
        temp(i) = 1;
    
    else
        temp(i) = -1;
    end
    
end

data1 = temp;

% c) Gaussian Noise Channel 
gaussian_noise = data1 + 0.01*randn(size(data1));
Y = raylrnd(gaussian_noise);
temp1 = zeros(size(gaussian_noise));

% d) Reciever model
for j = 1:length(gaussian_noise)
    if gaussian_noise(j) < 0
        temp1(j) = 0;
    
    else
        temp1(j) = 1;
    end
    
end

Y1 = temp1;

% e) BER calculation. Compare original data to the data recieved from
% the channel
num_errors_noise = biterr(data, Y1)

% f) BER comparison and plot
temp2 = zeros(size(Y));

for j = 1:length(Y)
    if Y(j) < 0
        temp2(j) = 0;
    
    else
        temp2(j) = 1;
    end
    
end

Y2 = temp2;
num_errors_channel_fading = biterr(data, Y2)

% Plot BER
t = 0:length(gaussian_noise) - 1;
plot(t, Y1)
xlim([1 100])
ylim([0 1.5])
title('BER as a function of the variance of additive White Gaussian Noise')
xlabel('t')
ylabel('Gaussian Noise')