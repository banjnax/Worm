function sita=cal_grad(x,y)
%%ԭ����Ϊf=30*exp(-((x-15)^2+(y-10)^2)/30)
%%x�����ݶ�Ϊf*(15-x)/10,y����Ϊf*(10-y)/15
e_x=30*exp(-((x-15)^2+(y-10)^2)/30)*(15-x)/15;
e_y=30*exp(-((x-15)^2+(y-10)^2)/30)*(10-y)/15;
tem=e_x/(sqrt(e_x^2+e_y^2));
sita=acos(tem);
v_x=[1 0 0];
v_f=[e_x e_y 0];
judge=cross(v_x,v_f);
if judge(3)<0
    sita=2*pi-sita;
end
    