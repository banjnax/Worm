function sita=cal_grad(x,y,flag)
switch flag
    case 1
        %%原函数为f=30*exp(-((x-5)^2+(y-10)^2)/30)
        %%x方向梯度为f*(15-x)/10,y方向为f*(10-y)/15
        e_x=30*exp(-((x-5)^2+(y-10)^2)/30)*(5-x)/15;
        e_y=30*exp(-((x-5)^2+(y-10)^2)/30)*(0-y)/15;
        tem=e_x/(sqrt(e_x^2+e_y^2));
        sita=acos(tem);
        v_x=[1 0 0];
        v_f=[e_x e_y 0];
        judge=cross(v_x,v_f);
        if judge(3)<0
            sita=2*pi-sita;
        end
    case 2
        %原函数
         %z1=30*exp(-((x-3).^2+(y-6).^2)/20);%温度高斯分布
         %z2=50*exp(-((x-10).^2+(y-10).^2)/20);%温度高斯分布
         e_x=30*exp(-((x-3)^2+(y-6)^2)/20)*(x-3)/10+50*exp(-((x-10)^2+(y-10)^2)/20)*(x-10)/10;
         e_y=30*exp(-((x-3)^2+(y-6)^2)/20)*(y-6)/10+50*exp(-((x-10)^2+(y-10)^2)/20)*(y-10)/10;
        tem=e_x/(sqrt(e_x^2+e_y^2));
        sita=acos(tem);
        v_x=[1 0 0];
        v_f=[e_x e_y 0];
        judge=cross(v_x,v_f);
        if judge(3)<0
            sita=2*pi-sita;
        end
    case 3
         %原函数
        %z1=30*exp(-((x-5)^2+(y-8)^2)/20);%温度高斯分布
        %z2=30*exp(-((x-10)^2+(y-3)^2)/20);%温度高斯分布
        %z3=50*exp(-((x-8)^2+(y-14)^2)/20);%温度高斯分布
         e_x=30*exp(-((x-5)^2+(y-8)^2)/20)*(x-5)/10+30*exp(-((x-10)^2+(y-3)^2)/20)*(x-10)/10+50*exp(-((x-8)^2+(y-14)^2)/20)*(x-8)/10;
         e_y=30*exp(-((x-5)^2+(y-8)^2)/20)*(y-8)/10+30*exp(-((x-10)^2+(y-3)^2)/20)*(y-3)/10+50*exp(-((x-8)^2+(y-14)^2)/20)*(y-14)/10;
        tem=e_x/(sqrt(e_x^2+e_y^2));
        sita=acos(tem);
        v_x=[1 0 0];
        v_f=[e_x e_y 0];
        judge=cross(v_x,v_f);
        if judge(3)<0
            sita=2*pi-sita;
        end
end
    