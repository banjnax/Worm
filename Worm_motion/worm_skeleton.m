%功能：模拟线虫的转向运动
function worm_motion()
clc
clear
body=0:.5:5;%相当于线虫身体里的关节点,为线虫长度
node=4;%线虫关节点，做正弦运动
delta_x=0.2;%步伐
height=0.5;%虫高
sita=pi/6.0;%线虫运动方向
[size_x size_y]=size(body);
x_t=zeros(1,size_y);%移位寄存器
sita_t=zeros(1,size_y);%角度移位寄存器
coor_S=init_worm_body(sita,size_y);%初始化线虫位置
count=0;%计数器
while count<300
    pause
    hold on
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
    
    x_t(size_y)=x_t(size_y)+delta_x;%步调更新
    x_t=mod(x_t,2*pi/node);%注意周期性，防止数据越来越大
    
    y_t=height*sin(node*x_t);%各个坐标系震动在次坐标系中的位置
    
    %转换为主坐标系坐标
    for ii=1:size_y
        xx_t(ii)=coor_S(ii,1)-y_t(ii)*sin(coor_S(ii,3));
        yy_t(ii)=coor_S(ii,2)+y_t(ii)*cos(coor_S(ii,3));
    end
    draw_skeleton(xx_t,yy_t,size_y)
    axis([1.5 4 0.8 3]);
    hold off
    %pause(0.1)
end
draw_skeleton(xx_t,yy_t,size_y);
axis([1.5 4 0.8 5]);

function coor_S=init_worm_body(sita,size_y)
   coor_S=zeros(size_y,3);%坐标系矩阵
    coor_S(1,1)=0;
    coor_S(2,2)=0;
    for i=2:size_y
        coor_S(i,3)=sita;
        [coor_S(i,1) coor_S(i,2)]=cal_Coor(coor_S(i-1,1),coor_S(i-1,2),sita,0.2);
    end
function draw_skeleton(xx_t,yy_t,size_y)
    for i=1:size_y-1
     plot(xx_t(i),yy_t(i),'o','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',2);
     line([xx_t(i) xx_t(i+1)],[yy_t(i) yy_t(i+1)],'color','b');
    end
    plot(xx_t(i+1),yy_t(i+1),'o','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',6);
    hold off
