function [P T]=generate()
clc
[x y]=meshgrid(-1:.1:20);
[size_x size_y]=size(x);
e_x=30*exp(-((x-15).^2+(y-10).^2)/30).*(15-x)/15;
e_y=30*exp(-((x-15).^2+(y-10).^2)/30).*(10-y)/15;
tem=e_x./(sqrt(e_x.^2+e_y.^2));
sita=acos(tem);
v_x=[1 0 0];
count=0;
for i=1:size_x
    for j=1:size_y
        count=count+1;
        P(1,count)=x(i,j);
        P(2,count)=y(i,j);
        v_f=[e_x(i,j) e_y(i,j) 0];
        judge=cross(v_x,v_f);
        if judge(3)<0
            sita(i,j)=2*pi-sita(i,j);
        end
        T(count)=sita(i,j);
        z(i,j)=sita(i,j);
%         T(1,count)=e_x(i,j);
%         T(2,count)=e_y(i,j);
    end
end
T
 %画出温度分布图
mesh(x,y,z)
   