% ������˹�˲������

close all;clear;clc;
Wn=400;     %����ͨ����ֹƵ��
[b,a]=butter(3,Wn,'low','s');

[H,F]=freqs(b,a);
plot(F,20*log10(abs(H)));    %ת��Ϊ��������ʽ
xlabel('Ƶ��');
ylabel('��ֵ');
title('��ͨ�˲���');
axis([0 800 -30 5]);
grid on;
Hs=tf(b,a)