num=[10];
den=conv([5,-1,0,0],[1,5])
[z,p,k]=tf2zp(num,den);   % tf2zp�����ݺ���ת��Ϊ�㼫����ʽ��һ��ת���������������㡢��������� 
p
nyquist(num,den)

figure(2)
w=logspace(-2,3,100);   %����10-2��103֮�䣬����100���Ⱦ���ĵ�p��
bode(num,den,w)
grid;

sys=tf(num,den)
sys_c=feedback(sys,1)
figure(3)
step(sys_c)            %���Ʊջ�ϵͳ�Ľ�Ծ��Ӧ����
