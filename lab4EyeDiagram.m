figure;
[t,x] = prz([1 0 1 0 0 0 1 1 0],1);
eyediagram(x, 75);
title('PRZ Eye Diagram')


figure(2);
[t,x] = urz([1 0 1 0 0 0 1 1 0],1);
eyediagram(x, 75);
title('URZ Eye Diagram')


figure(3);
[t,x] = unrz([1 0 1 0 0 0 1 1 0],1);
eyediagram(x, 75);
title('UNRZ Eye Diagram')


figure(4);
[t,x] = manchester([1 0 1 0 0 0 1 1 0],1);
eyediagram(x, 75);
title('Manchester Eye Diagram')


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
