function zt=hotpot_v2(x,y,flag,fp)

switch flag
    case 1
        %��Դ��
        zt=30*exp(-((x-15).^2+(y-15).^2)/500);%�¶ȸ�˹�ֲ�
    case 2
         z1=30*exp(-((x-3).^2+(y-6).^2)/20);%�¶ȸ�˹�ֲ�
         z2=50*exp(-((x-10).^2+(y-10).^2)/20);%�¶ȸ�˹�ֲ�
         zt=z1+z2;
    case 3
    %��Դ��
     z1=30*exp(-((x-5).^2+(y-8).^2)/20);%�¶ȸ�˹�ֲ�
     z2=30*exp(-((x-10).^2+(y-3).^2)/20);%�¶ȸ�˹�ֲ�
     z3=50*exp(-((x-8).^2+(y-14).^2)/20);%�¶ȸ�˹�ֲ�
     zt=z1+z2+z3;
    case 4
        [x_z y_z]=size(fp);
        zt=0;
        for i=1:y_z
            zt=fp(1,i)*exp(-((x-fp(2,i)).^2+(y-fp(3,i)).^2)/fp(4,i))+zt;
        end
end