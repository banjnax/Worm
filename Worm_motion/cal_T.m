function z=cal_T(x,y)
z1=15*exp(-((x-10)^2+(y-8)^2)/20);%温度高斯分布
z2=30*exp(-((x-15)^2+(y-10)^2));%温度高斯分布
z3=40*exp(-((x-8)^2+(y-14)^2));%温度高斯分布
z=-abs(z1+z2+z3-20);