% % Wn = (0,1);
% N = 12;
% Rp=3;
% Rs=20;
% fc1 = 500;
% fc2 = 1000;
% fs = 10000;
% [Y,X] = ellip(N,Rp,Rs,0.2 0.5,'stop');
% freqz(Y,X)
%specifications for BSF

Fs=10000;%sampling frequency

%band edge frequencies

wp1=2*500/Fs;wp2=2*1000/Fs;

%Yule walker design

f = [0 wp1 wp2 1];

m = [1 0 0 1];N=12;

[b,a] = yulewalk(N,f,m);

w=0:pi/1000:pi;

H = freqz(b,a,w);

plot(w/pi,20*log10(abs(H)),'b');hold on;

xlabel('w X pi');ylabel('|H(w)| in db')

%Elliptic Filter design for order 12

Rp=0.5;Rs=20;%Assumption

wp=[wp1 wp2];

[b,a] = ellip(6,Rp,Rs,wp,'stop');%elliptic returns 2n order transfer function. Hence enter order =6 for 12th order filter

H=freqz(b,a,w);

plot(w/pi,20*log10(abs(H)),'r');hold on;grid on;

%Elliptic Filter design for order 6

[b,a] = ellip(3,Rp,Rs,wp,'stop');%elliptic returns 2n order transfer function. Hence enter order =3 for 6th order filter

H=freqz(b,a,w);

plot(w/pi,20*log10(abs(H)),'m');hold off;

legend('Yule walker for order 12','Elliptic for order 12','Elliptic for order 6')

ylim([-100,20])