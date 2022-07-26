% FFT ���� ������
close all;clear;clc;
k=16;   %����Ƶ��
n1=[0:1:19];     %������20��
xa1=sin(2*pi*n1/k);

%����ԭʼ�����ź�
figure(1);
subplot(1,2,1)
stem(n1,xa1)
xlabel('t/T');ylabel('x(n)');
title("20���������ź�");

%{
xk1=fft(xa1);
xk1=abs(xk1);
subplot(1,2,2)
stem(n1,xk1)
xlabel('k');ylabel('X(k)');
title("20�������㸵��Ҷ��ֵ");
%}

n2=[0:1:15];
xa2=sin(2*pi*n2/k);
figure(2)
subplot(1,2,1)
stem(n2,xa2)
xlabel('t/T');ylabel('x(n)');
title("16���������ź�");

%{
xk2=fft(xa1);
xk2=abs(xk2);
subplot(1,2,2)
stem(n1,xk2)
xlabel('k');ylabel('X(k)');
title("16�������㸵��Ҷ��ֵ");
%}



