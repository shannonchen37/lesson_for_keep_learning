%������������ľ��
%t1 t2 t3 �ֱ��ʾf1 f2 f1��f2�����ʱ��
close all;clear;clc;
tspan=0.01;  %�������
t1=0:tspan:3.5; %ʱ������
t1_len=length(t1);
t2=0:tspan:3.5;
t2_len=length(t2);
t3=0:tspan:(t1_len+t1_len-2)*tspan; %���

%������Ŀ��Ҫ��������ź�(����ֱ��д�ɾ����źŵ���ʽ��
f1=[zeros(1,length([0:tspan:(1-0.01)])),3*ones(1,length([1:tspan:2])),zeros(1,length([2.01:tspan:3.5]))];
f2=[zeros(1,length([0:tspan:(1-0.01)])),1*ones(1,length([1:tspan:3])),zeros(1,length([3.01:tspan:3.5]))];

%�������źŽ��о��
w=conv(f1,f2);
w=w*tspan;

%����f1�źŲ���
subplot(3,1,1);
plot(t1,f1);
title('f1�źŲ���')
grid on;
xlabel('ʱ��t/s');
axis([0 7 0 4]) %�������귶Χ

%����f2�źŲ���
subplot(3,1,2);
plot(t2,f2);
title('f2�źŲ���')
grid on;
xlabel('ʱ��t/s');
axis([0 7 0 2]) %�������귶Χ

%����f1��f2����źŲ���
subplot(3,1,3);
plot(t3,w);
title('f1��f2����źŲ���')
grid on;
xlabel('ʱ��t/s');
















