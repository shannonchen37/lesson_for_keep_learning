num=1;
den=conv([1 2 2 0],[1 6 13]);
sys=tf(num,den);              
rlocus(sys);          %����ϵͳ�ĸ��켣
grid
hold on;
[k,r]=rlocfind(sys)       %ȷ���ٽ��ȶ�ʱ������ֵk�Ͷ�Ӧ�ļ���r 
sys_c=feedback(sys,1);    %�γɵ�λ�������ջ�ϵͳ
xlabel('Real Axis');
ylabel('Imaginary Axis') ;  %�����������˵��
title('Root Locus');         %��ͼ�μ��ϱ�
figure(2)
step(sys_c)            %���Ʊջ�ϵͳ�Ľ�Ծ��Ӧ����