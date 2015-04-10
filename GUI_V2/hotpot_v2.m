function zt=hotpot_v2(x,y,flag,fp)

switch flag
    case 1
        %单源点
        zt=30*exp(-((x-15).^2+(y-15).^2)/500);%温度高斯分布
    case 2
         z1=30*exp(-((x-3).^2+(y-6).^2)/20);%温度高斯分布
         z2=50*exp(-((x-10).^2+(y-10).^2)/20);%温度高斯分布
         zt=z1+z2;
    case 3
    %多源点
     z1=30*exp(-((x-5).^2+(y-8).^2)/20);%温度高斯分布
     z2=30*exp(-((x-10).^2+(y-3).^2)/20);%温度高斯分布
     z3=50*exp(-((x-8).^2+(y-14).^2)/20);%温度高斯分布
     zt=z1+z2+z3;
    case 4
        [x_z y_z]=size(fp);
        zt=0;
        for i=1:y_z
            zt=fp(1,i)*exp(-((x-fp(2,i)).^2+(y-fp(3,i)).^2)/fp(4,i))+zt;
        end
end