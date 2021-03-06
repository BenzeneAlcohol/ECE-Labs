kf=14;
Am=1;
fm=2;
beta = (kf*Am)/fm;
t=linspace(0,1,1000);
Ac=1;
fc=20;
Sfm=Ac*cos(2*pi*fc*t + beta*(sin(2*pi*fm*t)));
mt=Am*cos(2*pi*fm*t);
ct=Ac*cos(2*pi*fc*t);
subplot(3,1,1);
plot(mt);
title('Message Signal');
subplot(3,1,2);
plot(ct);
title('Carrier Signal');
subplot(3,1,3);
plot(Sfm);
title('Modulated Signal');
