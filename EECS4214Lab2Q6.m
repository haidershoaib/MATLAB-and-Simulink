u = rand(1000,1); %generating random 1000 variables

ensAvg = nanmean(u) %generating ensemble average

timeAvg = mean(u) %generating time average

% since the ensemble averaging is the same as time averaging, its ergodic

% part B

v = 10*rand(1000,1) - 5;%generating random 1000 variables

ensAvg2 = nanmean(v)%generating ensemble average

timeAvg2 = mean(v)%generating time average

%part C

xmin = -0.5;
xmax = 0.5;
n = 1000;
x = xmin+rand(1,n)*(xmax-xmin);%generating random 1000 variables with interval
%(-0.5,0.5)
autocorr(x) %generate autocorrelation
auto = autocorr(x);
dis = fft(auto) %power spectrum

%part d

%Simulation window parameters
r=200; %radius of disk
areaTotal=pi*r^2; %area of disk
 %Point process parameters
lambda=100; %intensity (ie mean density) of the Poisson process
 %Simulate Poisson point process
numbPoints=poissrnd(areaTotal*lambda)%Poisson number of points
