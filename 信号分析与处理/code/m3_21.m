%ϵͳ��������Ӧ

close all;clear;clc;
%ϵ������
a=[3,0.5,-0.1];
b=[1,1,0];
figure(1)
impz(b,a,-3:10);    %ʱ�䷶Χ����ͼ
title('��λ������Ӧ');

%��������Ӧ
k=0:15;     %ʱ�䷶Χ
x=2.^k;     %�������б��ʽ
%x=(0.5).^k;     %�������б��ʽ
y=filter(b,a,x);    %filter()�˲���������ʹ�ò���ƽ��
figure(2)
subplot(2,1,1);
stem(k,x)
title('��������')
subplot(2,1,2);
stem(k,y)
title('�������')