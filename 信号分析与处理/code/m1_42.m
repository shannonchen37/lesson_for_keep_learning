%���źŵ�Ƶ�׸���Ҷ���仯,�������ʽ
close all;clear;clc;
syms t w a;     %�������
Fw = sym(2*a/(w^2+a^2));    %��Ŀ���ʽ
ft=ifourier(Fw,w,t)    %����Ҷ���仯