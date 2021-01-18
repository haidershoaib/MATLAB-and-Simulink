% Lab 2q4d code %

x = (0:1:10000);

rand1 = ncx2rnd(1,2,1,10000);
ncx2_1 = ncx2pdf(x,1,2);
chi2_1 = chi2pdf(x,1);

rand2 = ncx2rnd(2,2,1,10000);
ncx2_2 = ncx2pdf(x,2,2);
chi2_2 = chi2pdf(x,2);

rand3 = ncx2rnd(3,2,1,10000);
ncx2_3 = ncx2pdf(x,3,2);
chi2_3 = chi2pdf(x,3);

rand4 = ncx2rnd(4,2,1,10000);
ncx2_4 = ncx2pdf(x,4,2);
chi2_4 = chi2pdf(x,4);

rand5 = ncx2rnd(5,2,1,10000);
ncx2_5 = ncx2pdf(x,5,2);
chi2_5 = chi2pdf(x,5);

subplot (3,2,1);
plot(x,ncx2_1,'b-','LineWidth',2)
title('PDF and CDF k = 1')
hold on;
plot(x,chi2_1,'g-','LineWidth',2)
xlim([0 50])

subplot (3,2,2);
plot(x,ncx2_2,'b-','LineWidth',2)
title('PDF and CDF k = 2')
hold on;
plot(x,chi2_2,'g-','LineWidth',2)
xlim([0 50])

subplot (3,2,3);
plot(x,ncx2_3,'b-','LineWidth',2)
title('PDF and CDF k = 3')
hold on;
plot(x,chi2_3,'g-','LineWidth',2)
xlim([0 50])

subplot (3,2,4);
plot(x,ncx2_4,'b-','LineWidth',2)
title('PDF and CDF k = 4')
hold on;
plot(x,chi2_4,'g-','LineWidth',2)
xlim([0 50])

subplot (3,2,5);
plot(x,ncx2_5,'b-','LineWidth',2)
title('PDF and CDF k = 5')
hold on;
plot(x,chi2_5,'g-','LineWidth',2)
xlim([0 50])