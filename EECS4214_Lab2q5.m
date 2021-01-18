% Lab 2 q5

% Chi-Distrubuted numbers with k = {1, 5}
x1 = ncx2rnd(2,1,1,10000);
x2 = ncx2rnd(2,2,1,10000);
x3 = ncx2rnd(2,3,1,10000);
x4 = ncx2rnd(2,4,1,10000);
x5 = ncx2rnd(2,5,1,10000);

% Mean
x = (x1 + x2 + x3 + x4 + x5)/5;

%Plot
figure(1)
hist(x)
title('Central Limit Theorem for Chi-Distrubution');