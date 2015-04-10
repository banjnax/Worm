function [x0,y0]=cal_xy_3(x1,y1,sita)
k=tan(sita);
sita=sita*180/pi;
tem1=0.1/(sqrt(1+k^2));
tem2=k*tem1;
if sita>=0 && sita<=90
    x0=x1+tem1;
    y0=y1+tem2;
else if sita <=180
    x0=x1-tem1;
    y0=y1+tem2;
else if sita <=270
    x0=x1-tem1;
    y0=y1-tem2;
else 
    x0=x1+tem1;
    y0=y1-tem2;
    end
    end
end

