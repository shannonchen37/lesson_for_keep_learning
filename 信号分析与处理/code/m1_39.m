%�����źŷ���Ƶ��
close all;clear;clc;
syms t v w x;       %�������

%��ʾ��Ŀ�����ı��ʽ
% heaviside(x)������ʾ��Ծ���� returns the value 0 for x < 0, 1 for x > 0, and 1/2 for x = 0.
% x=1/2*exp(-1*t)*sym('heaviside(t)');    %�����еı��ʽ
x=sym(1/2*exp(-1*t)*heaviside(t-1));    %��Ŀ�޸ĺ�ı��ʽ,matlab�汾̫�ߣ�ȥ��������

%����Ҷ�仯
F = fourier(x);

%����ԭ�źŲ���
subplot(2,1,1);
ezplot(x);     %��ezplot���ƺ���������fplot���棬matlab�汾̫�ߣ�ȥ��������
%fplot(x);

%���Ƹ���Ҷ�仯֮��Ĳ���
subplot(2,1,2);
ezplot(abs(F));     %��ezplot���ƺ���������fplot���棬matlab�汾̫�ߣ�ȥ��������
%fplot('abs(F)');