%% ����һ a) sincos
clc;close all;clear;
t=0:0.1:2*pi;
subplot(1,2,1);
plot(t,sin(t),'ro');
hold on
plot(t,sin(t),'b');
grid on
title('sin(x)');

subplot(1,2,2);
plot(t,cos(t),'b*');
hold on
plot(t,cos(t),'b');
grid on
title('cos(x)');
%% ����һ b) r=sin(2t)cos(2t)
clc;close all;clear;
theta=linspace(0,2*pi,1000);
r=sin(2*theta).*cos(2*theta);   %��ˣ�ÿ��Ԫ�ؽ������
polar(theta,r,'r');
title('sin(2t)cos(2t)');
%% ����һ c) y=exp(x)
clc;close all;clear;
t=logspace(-1,2,100);
loglog(t,exp(t),'b');
grid on;
xlabel('x');
ylabel('y');
title('exp(x)');
%% ����� ��ά��ͼqiumian
[x,y]=meshgrid(-2:0.1:2,-2:0.1:2);%ʹ��meshgrid�õ�����Χ�Ķ�ά����
z=x.^2+y.^2;%��Ԫ������
subplot(1,2,1);
mesh(x,y,z);
title('mesh  z=x^2+y^2');
subplot(1,2,2)
surf(x,y,z);
title('surf z=x^2+y^2');