clc
close all

fc = 1000;
fs = 8000;
N = 4;

figure (1) 
[b,a] = butter(N,fc/(fs/2), 'low');
freqz(b,a);
title('butterworth low pass filter')

figure (2)
[b1,a1] = cheby1(N,0.5,fc/(fs/2),'low');
freqz(b1,a1); 
title('chebychev I low pass filter')


figure (3)
[b2,a2] = cheby2(N,20,fc/(fs/2), 'low');
freqz(b2,a2);
title('chebychev II low pass filter')

figure (4)
[b3,a3] = ellip(N,0.5,20,fc/(fs/2), 'low');
freqz(b3,a3);
title('Elliptic low pass filter')




