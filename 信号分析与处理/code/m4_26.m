close all;clear;clc;
%b=fir1(48,[0.35,0.65]);
b=fir1(30,[0.1,0.3]);
[H,F]=freqz(b,1,512,1000);
plot(F,20*log10(abs(H)));
xlabel('Ƶ��/(rad/s)');
ylabel('��ֵ/dB');
title('��ͨ�����˲���');
axis([0 500 -100 20]);
grid on;
Hz=tf(b,1,1/1000,'Variable','z^-1')