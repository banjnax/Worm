function [P T]=generate(handles)
clc
[x1 y1]=meshgrid(-1:.5:20);
[size_x size_y]=size(x1);
count=0;
x_t=x1(1,:);
y_t=y1(:,1)';
fp=handles.fps;
flag=handles.pic;
for i=1:size_x
    for j=1:size_y
        count=count+1;
        x=x_t(i);
        y=y_t(j);
        switch flag
            case 1
                e_x=30*exp(-((x-5)^2+(y-5)^2)/500)*(5-x)/250;
                e_y=30*exp(-((x-5)^2+(y-5)^2)/500)*(5-y)/250;
            case 2
                e_x=30*exp(-((x-3)^2+(y-6)^2)/20)*(x-3)/10+50*exp(-((x-10)^2+(y-10)^2)/20)*(x-10)/10;
                e_y=30*exp(-((x-3)^2+(y-6)^2)/20)*(y-6)/10+50*exp(-((x-10)^2+(y-10)^2)/20)*(y-10)/10;
            case 3
                e_x=30*exp(-((x-5)^2+(y-8)^2)/20)*(x-5)/10+30*exp(-((x-10)^2+(y-3)^2)/20)*(x-10)/10+50*exp(-((x-8)^2+(y-14)^2)/20)*(x-8)/10;
                e_y=30*exp(-((x-5)^2+(y-8)^2)/20)*(y-8)/10+30*exp(-((x-10)^2+(y-3)^2)/20)*(y-3)/10+50*exp(-((x-8)^2+(y-14)^2)/20)*(y-14)/10;
            case 4
                [x_z y_z]=size(fp);
                e_x=0;
                e_y=0;
                for i=1:y_z
                    e_x=fp(1,i)*exp(-((x-fp(2,i))^2+(y-fp(3,i))^2)/fp(4,i))*(x-fp(2,i))*2/fp(4,i)+e_x;
                    e_y=fp(1,i)*exp(-((x-fp(2,i))^2+(y-fp(3,i))^2)/fp(4,i))*(y-fp(3,i))*2/fp(4,i)+e_y;
                end
        end
        P(1,count)=x_t(i);
        P(2,count)=y_t(j);
       
        T(1,count)=e_x;
        T(2,count)=e_y;
    end
end
   