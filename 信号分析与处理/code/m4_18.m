%����б�ѩ���˲���
close all;clear;clc;
%[z,p,k]=cheb1ap(8,4);   %�����б�ѩ�����
[z,p,k]=cheb1ap(6,5);
[num,den]=zp2tf(z,p,k);
[H,W]=freqs(num,den);
%���������˲�����Ƶ��������
subplot(2,1,1);
plot(W,20*log10(abs(H)));
xlabel('ģ��Ƶ��/(rad/s)');
ylabel('��ֵ/dB');
title('��ͨ�˲���');
axis([0 10 -250 10]);
grid on;
%���ƷŴ���˲�����Ƶ��������
subplot(2,1,2);
plot(W,20*log10(abs(H)));
xlabel('ģ��Ƶ��/(rad/s)');
ylabel('��ֵ/dB');
title('��ͨ�˲���ͨ���Ŵ�');
axis([0 3 -10 10]);
grid on;
%���ϵͳ����
Hs=tf(num,den)
