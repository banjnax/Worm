%%模拟线虫的温度趋向性，根据paper的regular
function worm_chemotaixs()
clc
clear
[x,y]=meshgrid(-1:.1:20);%绘制底面温度图像
z=hotpot(x,y);
best_T=20;
z=-abs(z-best_T);

body=0:.2:2;%相当于线虫身体里的关节点,为线虫长度
node=4;%线虫关节点，做正弦运动
delta_x=0.1;%步伐
sita=pi/3.0;%线虫运动方向
[size_x size_y]=size(body);
x_t=zeros(1,size_y);%步调移位寄存器
sita_t=zeros(1,size_y);%角度移位寄存器
coor_S=init_worm_body(sita,size_y);%初始化线虫位置
zt3=-1000;%初始浓度
axis([-1 20 -1 20]);

mem_size=5;%记忆体数量
Mem=zeros(1,mem_size);
% net=bp_net_worm();
count=0;%步数计数器

delta_T_multi=1;%参考性转角乘子
current_count=0;%连续性相关
last_count=0;%连续性相关

while 1
   count=count+1
   
   %画出温度分布图
   pcolor(x,y,z)
   shading interp;
   colorbar
   %contour(x,y,z,30);
   hold on
   
    %更新坐标寄存器
    for j=1:size_y-1
        coor_S(j,:)=coor_S(j+1,:);%坐标系定向移动
        x_t(j)=x_t(j+1);%y轴步调
    end
    coor_S(size_y,3)=sita;%头部坐标系角度更新
    [coor_S(size_y,1),coor_S(size_y,2)]=cal_xy_3(coor_S(size_y,1),coor_S(size_y,2),coor_S(size_y,3));%头部坐标系原点移动更新
    x_t(size_y)=x_t(size_y)+delta_x;%步调更新
    x_t=mod(x_t,2*pi/node);%注意周期性，防止数据越来越大
    y_t=0.2*sin(node*x_t);%各个坐标系震动在次坐标系中的位置
    
    %转换为主坐标系坐标
    for ii=1:size_y
        xx_t(ii)=coor_S(ii,1)-y_t(ii)*sin(coor_S(ii,3));
        yy_t(ii)=coor_S(ii,2)+y_t(ii)*cos(coor_S(ii,3));
    end
    
     zt2=zt3;
     zt1=cal_T(xx_t(size_y),yy_t(size_y));%计算头部温度值
     zt3=cal_T(coor_S(size_y,1),coor_S(size_y,2));%计算大方向值
   
     %更新记忆体
    for jj=1:mem_size-1
        Mem(jj)=Mem(jj+1);
    end
    Mem(mem_size)=zt1;
    
   if zt1>=-1&&zt1<=2%到达最适合温度
       zt1
       coor_S(size_y,1)
       coor_S(size_y,2)
       plot(xx_t,yy_t,'w');
       break
   end
   
    %与连续发生N次的时间函数段相匹配
   if last_count~=0
       last_count=mod(last_count+1,5);
   end
   
   if zt2>zt3%如温度呈现出下降趋势，则线虫转向！！！这步也是由神经网络做出判断 
       
       %ran_angle=rand(1)*pi/2;%产生一个随机角度，符号1
%%神经网络尝试探测应该所转角度  
%        for kk=1:4
%            if Mem(kk)>Mem(kk+1)
%                Mem1(kk)=1;
%            else
%                Mem1(kk)=-1;
%            end
%            if Mem(5)>0
%                Mem1(5)=1;
%            else
%                Mem1(5)=-1;
%            end
%        end
%        aa = sim(net,Mem1');%记忆体数据用来做网络的输入
%        aa=int32(aa+0.5);
%        if aa==0
%        sita=sita-pi/18.0;
%        else
%            sita=sita+pi/18.0;
%        end
       
       %判断是否是连续的N次温度下降
       if last_count==0
           last_count=1;
           current_count=0;
       end
       if (current_count+1)==last_count
           current_count=current_count+1;
           if current_count==4
                 delta_T_multi=delta_T_multi+1;%符号3
                   if delta_T_multi==9
                       delta_T_multi=1;
                   end
                 current_count=mod(current_count,4);
           end
       else
           current_count=0;
           last_count=0;
       end
           
       %当前方向的齐次坐标
       v_t(1)=coor_S(size_y,1)-coor_S(size_y-1,1);
       v_t(2)=coor_S(size_y,2)-coor_S(size_y-1,2);
       v_t(3)=0;

       %线虫头部坐标的方向
       v_t2(1)=cos(sita);
       v_t2(2)=sin(sita);
       v_t2(3)=0;

       judge=cross(v_t,v_t2);%用叉积判断线虫左转还是右转，也即用叉积判断线虫头部方向在大方向的左边还是右边,z大于0，在左边,z小于0在右边
       if judge(3)>0
           %sita=sita+ran_angle;%！！！所转角度后面由神经网络得出，符号1
            sita=sita+pi/18.0*delta_T_multi;%！！！所转角度后面由神经网络得出，符号3
            sita=mod(sita,2*pi);
%           ran_angle
%            count 
%            Mem
%            Mem_store(:,count)=Mem';
%            angle_store(count)=pi/18.0;
       else
          % sita=sita-ran_angle;%符号1
%             sita=sita-pi/18.0*delta_T_multi;%！！！所转角度后面由神经网络得出
            sita=sita-pi/18.0*delta_T_multi;%！！！所转角度后面由神经网络得出符号3
            sita=mod(sita,2*pi);
     %      ran_angle
%            count 
%            Mem
%            Mem_store(:,count)=Mem';
%            angle_store(count)=-pi/18.0;
       end
       
       %%沿着梯度方向
       sita=cal_grad(xx_t(size_y),yy_t(size_y));%符号2，线虫的梯度转向
       %sita=sita+pi/10;%线虫的偏向性转向
       
   end
   Mem_stores(:,count)=Mem';
  Mem_grad(count)=cal_grad(xx_t(size_y),yy_t(size_y));
   
    plot(xx_t,yy_t,'w');
    axis([-1 20 -1 20]);
    hold off
    pause(0.01)
end
% Mem_store
% angle_store
save Mem_stores
save Mem_grad

function coor_S=init_worm_body(sita,size_y)
    coor_S=zeros(size_y,3);%坐标系矩阵
    coor_S(1,1)=0;
    coor_S(2,2)=0;
    for i=2:size_y
        coor_S(i,3)=sita;
        [coor_S(i,1) coor_S(i,2)]=cal_Coor(coor_S(i-1,1),coor_S(i-1,2),sita,0.2);
    end



