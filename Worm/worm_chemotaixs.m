%%ģ���߳���¶������ԣ�����paper��regular
function worm_chemotaixs()
clc
clear
[x,y]=meshgrid(-1:.1:20);%���Ƶ����¶�ͼ��
% z=40*exp(-((x-5).^2+(y-5).^2));%�¶ȸ�˹�ֲ�
z=hotpot(x,y);

best_T=20;
z=-abs(z-20);
body=0:.2:2;%�൱���߳�������Ĺؽڵ�,Ϊ�߳泤��
node=4;%�߳�ؽڵ㣬�������˶�
delta_x=0.1;%����
sita=pi/6.0;%�߳��˶�����
[size_x size_y]=size(body);
x_t=zeros(1,size_y);%��λ�Ĵ���
sita_t=zeros(1,size_y);%�Ƕ���λ�Ĵ���
coor_S=zeros(size_y,3);%����ϵ����
zt1=-1000;%��ʼŨ��
axis([-1 20 -1 20]);

mem_size=5;%����������
Mem=zeros(1,mem_size);
% net=bp_net_worm();
while 1
   pcolor(x,y,z)
   shading interp;
   colorbar
   hold on
    %���¼Ĵ���
    for j=1:size_y-1
        coor_S(j,:)=coor_S(j+1,:);%����ϵ�����ƶ�
        x_t(j)=x_t(j+1);%y�Ჽ��
    end
    [coor_S(size_y,1),coor_S(size_y,2)]=cal_xy_3(coor_S(size_y,1),coor_S(size_y,2),coor_S(size_y,3));%ͷ������ϵԭ���ƶ�����
    coor_S(size_y,3)=sita;%ͷ������ϵ�Ƕȸ���
    
    x_t(size_y)=x_t(size_y)+delta_x;%��������
    x_t=mod(x_t,2*pi/node);%ע�������ԣ���ֹ����Խ��Խ��
    
    y_t=0.2*sin(node*x_t)+1;%��������ϵ���ڴ�����ϵ�е�λ��
    
    %ת��Ϊ������ϵ����
    for ii=1:size_y
        xx_t(ii)=coor_S(ii,1)-y_t(ii)*sin(coor_S(ii,3));
        yy_t(ii)=coor_S(ii,2)+y_t(ii)*cos(coor_S(ii,3));
    end
    
   zt2=zt1;
%    zt1=-abs(40*exp(-((xx_t(size_y)-5)^2+(yy_t(size_y)-5)^2))-20);%����ͷ���¶�ֵ
%    zt3=-abs(40*exp(-((coor_S(size_y,1)-5)^2+(coor_S(size_y,2)-5)^2))-20);%�������ֵ
zt1=cal_T(xx_t(size_y),yy_t(size_y));
zt3=cal_T(coor_S(size_y,1),coor_S(size_y,2));
   
     %���¼�����
    for jj=1:mem_size-1
        Mem(jj)=Mem(jj+1);
    end
    Mem(mem_size)=zt1;
    
   if zt1>=-1&&zt1<=2%�������ʺ��¶�
       zt1
       coor_S(size_y,1)
       coor_S(size_y,2)
       plot(xx_t,yy_t,'w');
       break
   end

   if(zt1<zt3)%���¶ȳ��ֳ��½����ƣ����߳�ת�򣡣����ⲽҲ���������������ж�
       %��ǰ������������
       v_t(1)=coor_S(size_y,1)-coor_S(size_y-1,1);
       v_t(2)=coor_S(size_y,2)-coor_S(size_y-1,2);
       v_t(3)=0;

       %�߳�ͷ������ķ���
       v_t2(1)=cos(sita);
       v_t2(2)=sin(sita);
       v_t2(3)=0;
       
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
%        aa = sim(net,Mem1');
%        aa=int32(aa+0.5);
%        if aa==0
%        sita=sita-pi/18.0;
%        else
%            sita=sita+pi/18.0;
%        end
       

       judge=cross(v_t,v_t2);%�ò���ж��߳���ת������ת��Ҳ���ò���ж��߳�ͷ�������ڴ������߻����ұ�,z����0�������,zС��0���ұ�
       if judge(3)>0
           sita=sita+pi/18.0;%��������ת�ǶȺ�����������ó�
           sita=mod(sita,2*pi);
%            count 
%            Mem
%            pi/18.0
%            Mem_store(:,count)=Mem';
%            angle_store(count)=pi/18.0;
%            count=count+1;
       else
           sita=sita-pi/18.0;
           sita=mod(sita,2*pi);
%            count 
%            Mem
%            -pi/18.0
%            Mem_store(:,count)=Mem';
%            angle_store(count)=-pi/18.0;
%            count=count+1;
           
       end
   end
  
    plot(xx_t,yy_t,'w');
    axis([-1 20 -1 20]);
    hold off
    pause(0.01)
end
% Mem_store
% angle_store

