%��Ƶ�ͨ�˲������б�ѩ��
close all;clear;clc;
%Ƶ�ʹ�һ��
Wp=100/500;
Ws=200/500;
Rp=3;   %ͨ������
Rs=30;  %���˥��
[n,Wp]=cheb1ord(Wp,Ws,Rp,Rs);
[b,a]=cheby1(n,Rp,Wp);
[H,F]=freqz(b,a,512,1000);
plot(F,20*log10(abs(H)));
xlabel('Ƶ��/(rad/s)');
ylabel('��ֵ/dB');
title('���ֵ�ͨ�˲���');
axis([0 500 -200 20]);
grid on;
Hz=tf(b,1,1/1000,'Variable','z^-1')
