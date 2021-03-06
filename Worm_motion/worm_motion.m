%功能：模拟线虫的转向运动
function worm_motion()
clc
clear
body=0:.2:3;%相当于线虫身体里的关节点,为线虫长度
node=4;%线虫关节点，做正弦运动
delta_x=0.1;%步伐
height=0.5;%虫高
sita=pi/6.0;%线虫运动方向
[size_x size_y]=size(body);
x_t=zeros(1,size_y);%移位寄存器
sita_t=zeros(1,size_y);%角度移位寄存器
coor_S=init_worm_body(sita,size_y);%初始化线虫位置
mem_size=5;%记忆体数量
Mem=zeros(1,mem_size);%线虫的长期记忆
count=0;%计数器
while count<300
    pause
    %pause(0.1)
    count=count+1;
    if count==50
        count
        sita=sita-pi/10;
        coor_S(size_y,1)
        coor_S(size_y,1)*Z_k-Z_err
        coor_S(size_y,1)*Z_k+Z_err
    end
    %更新寄存器
    for j=1:size_y-1
        coor_S(j,:)=coor_S(j+1,:);%坐标系定向移动
        x_t(j)=x_t(j+1);%y轴步调
    end
    [coor_S(size_y,1),coor_S(size_y,2)]=cal_xy_3(coor_S(size_y,1),coor_S(size_y,2),coor_S(size_y,3));%头部坐标系原点移动更新
    coor_S(size_y,3)=sita;%头部坐标系角度更新
    
    %画出坐标轴移动轨迹
    storepoint_x(count)=coor_S(size_y,1);
    storepoint_y(count)=coor_S(size_y,2);
    
    x_t(size_y)=x_t(size_y)+delta_x;%步调更新
    x_t=mod(x_t,2*pi/node);%注意周期性，防止数据越来越大
    
    y_t=height*sin(node*x_t);%各个坐标系震动在次坐标系中的位置
    
    %转换为主坐标系坐标
    for ii=1:size_y
        xx_t(ii)=coor_S(ii,1)-y_t(ii)*sin(coor_S(ii,3));
        yy_t(ii)=coor_S(ii,2)+y_t(ii)*cos(coor_S(ii,3));
    end
    
     %更新记忆体
    for jj=1:mem_size-1
        Mem(jj)=Mem(jj+1);
    end
    Mem(mem_size)=0;
    
    plot(xx_t,yy_t,'b');
    axis([0 10 0 10]);
    hold on
    
    %画坐标系
    [coor_xx,coor_yy]=draw_Coor(coor_S(size_y,1),coor_S(size_y,2),sita);
    Coor(coor_xx,coor_yy);
    sita_1=pi/6;
    sita_2=sita_1-pi/10;
    hold on
    Z_err=height/cos(sita_1);
    Z_k=tan(sita_1);
    line([0 6.84],[Z_err 6.84*Z_k+Z_err],'color','k');
    hold on
    line([0 6.84],[-Z_err 6.84*Z_k-Z_err],'color','k');
    hold on
    
    Z_k=tan(sita_2);
     line([6.84 10],[3.372 Z_k*3.16+3.372],'color','k');
    hold on
     line([6.84 10],[4.527 Z_k*3.16+4.527],'color','k');
    hold on
    
    line([coor_xx(3) coor_xx(6)],[coor_yy(3) coor_yy(6)],'color','r');
    hold on
    
    %画坐标轴移动轨迹
    plot(storepoint_x,storepoint_y,'g');
    axis([0 10 0 10]);
    hold off
    %pause(0.1)
end
plot(xx_t,yy_t,'b');
axis([0 10 0 10]);

function coor_S=init_worm_body(sita,size_y)
   coor_S=zeros(size_y,3);%坐标系矩阵
    coor_S(1,1)=0;
    coor_S(2,2)=0;
    for i=2:size_y
        coor_S(i,3)=sita;
        [coor_S(i,1) coor_S(i,2)]=cal_Coor(coor_S(i-1,1),coor_S(i-1,2),sita,0.2);
    end
    
function Coor(coor_xx,coor_yy)
    line([coor_xx(1) coor_xx(2)],[coor_yy(1) coor_yy(2)],'color','r');
    hold on
    line([coor_xx(1) coor_xx(3)],[coor_yy(1) coor_yy(3)],'color','r');
    hold on
    line([coor_xx(1) coor_xx(8)],[coor_yy(1) coor_yy(8)],'color','r');
    hold on
    line([coor_xx(2) coor_xx(4)],[coor_yy(2) coor_yy(4)],'color','r');
    hold on
    line([coor_xx(2) coor_xx(5)],[coor_yy(2) coor_yy(5)],'color','r');
    hold on
    line([coor_xx(3) coor_xx(6)],[coor_yy(3) coor_yy(6)],'color','r');
    hold on
    line([coor_xx(3) coor_xx(7)],[coor_yy(3) coor_yy(7)],'color','r');
    

