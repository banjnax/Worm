function z=cal_T_v2(x,y,flag,bt,fp)
switch flag
    case 1
         zt=30*exp(-((x-5).^2+(y-10).^2)/30);%�¶ȸ�˹�ֲ�
         z=-abs(zt-bt);
    case 2
        z1=30*exp(-((x-3).^2+(y-6).^2)/20);%�¶ȸ�˹�ֲ�
        z2=50*exp(-((x-10).^2+(y-10).^2)/20);%�¶ȸ�˹�ֲ�
        zt=z1+z2;
        z=-abs(zt-bt);
    case 3
        z1=30*exp(-((x-5)^2+(y-8)^2)/20);%�¶ȸ�˹�ֲ�
        z2=30*exp(-((x-10)^2+(y-3)^2)/20);%�¶ȸ�˹�ֲ�
        z3=50*exp(-((x-8)^2+(y-14)^2)/20);%�¶ȸ�˹�ֲ�
        z=-abs(z1+z2+z3-bt);
    case 4
        [x_z y_z]=size(fp);
        z1=0;
        for i=1:y_z
            z1=fp(1,i)*exp(-((x-fp(2,i))^2+(y-fp(3,i))^2)/fp(4,i))+z1;
        end
        z=-abs(z1-bt);
end