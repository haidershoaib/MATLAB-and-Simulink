n = randi([0 1],1,30);
Ts = 1/1600;
figure;
[t,x] = prz(n,Ts);
plot(t,x)
axis([0 30 -1.1 1.1]);
title('Polar RZ');


figure(2);
[t,x] = urz(n,Ts);
plot(t,x)
axis([0 30 0 1.1]);
title('Unipolar RZ');

figure(3);
[t,x] = unrz(n,Ts);
plot(t,x)
axis([0 30 0 1.1]);
title('Unipolar NRZ');

figure(4);
[t,x] = manchester(n,Ts);
plot(t,x)
axis([0 30 -1 1.1]);
title('Manchester');

figure;
[t,x] = prz(n,Ts);
plot(t,x)
axis([0 30 -1.1 1.1]);
title('Polar RZ');

figure(2);
[t,x] = urz(n,Ts);
plot(t,x)
axis([0 30 0 1.1]);
title('Unipolar RZ');

figure(3);
[t,x] = unrz(n,Ts);
plot(t,x)
axis([0 30 0 1.1]);
title('Unipolar NRZ');

figure(4);
[t,x] = manchester(n,Ts);
plot(t,x)
axis([0 30 -1 1.1]);
title('Manchester');



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
