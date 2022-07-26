%����Ƶ�ʱ仯������֪�弤��Ӧ��ϵͳ���룬�����

close all;clear;clc;
syms w t;   %����w��t
h=10*t*exp(-2*t)*heaviside(t);   %heaviside()=u(t)
H=fourier(h);
[Hn,Hd]=numden(H);   %�õ�H�ķ��Ӻͷ�ĸ
Hnum=abs(sym2poly(Hn));     %���ϵ������
Hden=abs(sym2poly(Hd));

%����Ƶ������
[Hh,Hw]=freqs(Hnum,Hden,500);   
Hh1=abs(Hh);    %��Ƶ����
Hw1=angle(Hh);  %��Ƶ����

%����ϵͳ�ķ�Ƶ���Ժ���Ƶ����
subplot(2,1,1);
plot(Hw,Hh1);
grid on;
xlabel('��Ƶ��');
ylabel('����');
title('H(j)�ķ�Ƶ����');
axis([0 10 0 3]);

subplot(2,1,2);
plot(Hw,Hw1*180/pi);
grid on;
xlabel('��Ƶ��');
ylabel('��λ');
title('H(j)����Ƶ����');

%����������Ӧ
x=exp(-2*t)*heaviside(t);
X=fourier(x);
Y=X*H;      %Ƶ�����
y=ifourier(Y);   %����Ҷ���仯
figure(2)
ezplot(y,[-4,20]);
axis([-2 10 0 1]);
grid on;
title('ͨ��Ƶ��Y����y');
xlabel('t');
ylabel('y(t)');
