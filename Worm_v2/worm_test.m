function worm_test()
%%ģ���߳���¶������ԣ�����paper��regular
clc
clear
[x,y]=meshgrid(0:.1:20);%���Ƶ����¶�ͼ��
% z=40*exp(-((x-5).^2+(y-5).^2));%�¶ȸ�˹�ֲ�
z=hotpot(x,y);

best_T=20;
z=-abs(z-20);
body=0:.2:2;%�൱���߳�������Ĺؽڵ�,Ϊ�߳泤��
node=4;%�߳�ؽڵ㣬�������˶�
delta_x=0.1;%����
sita=pi/2.0-pi/10;%�߳��˶�����
[size_x size_y]=size(body);
x_t=zeros(1,size_y);%��λ�Ĵ���
sita_t=zeros(1,size_y);%�Ƕ���λ�Ĵ���
%coor_S=zeros(size_y,3);%����ϵ����
coor_S=init_worm_body(sita,size_y);
zt3=-1000;%��ʼŨ��
zt2=-1111;
axis([10 15 10 15]);

mem_size=5;%����������
Mem=zeros(1,mem_size);
% net=bp_net_worm();
count=0;%����������

delta_T_multi=1;%�ο���ת�ǳ���
current_count=0;%���������
last_count=0;%���������
while 1
   count=count+1
   
   %�����¶ȷֲ�ͼ
   pcolor(x,y,z)
   shading interp;
   colorbar
   hold on
   

   
   
    %����������N�ε�ʱ�亯������ƥ��
   if last_count~=0
       last_count=mod(last_count+1,5);
   end
   
   if zt2>zt3%���¶ȳ��ֳ��½����ƣ����߳�ת�򣡣����ⲽҲ���������������ж�  
       %��ǰ������������
       v_t(1)=coor_S(size_y,1)-coor_S(size_y-1,1);
       v_t(2)=coor_S(size_y,2)-coor_S(size_y-1,2);
       v_t(3)=0;

       %�߳�ͷ������ķ���
       v_t2(1)=cos(sita);
       v_t2(2)=sin(sita);
       v_t2(3)=0;

       judge=cross(v_t,v_t2);%�ò���ж��߳���ת������ת��Ҳ���ò���ж��߳�ͷ�������ڴ������߻����ұ�,z����0�������,zС��0���ұ�
       %ran_angle=rand(1)*pi/2;%����һ������Ƕȣ�����1
       
              
%%�����糢��̽��Ӧ����ת�Ƕ�  
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
%        aa = sim(net,Mem1');%�������������������������
%        aa=int32(aa+0.5);
%        if aa==0
%        sita=sita-pi/18.0;
%        else
%            sita=sita+pi/18.0;
%        end
       

       
       %�ж��Ƿ���������N���¶��½�
       if last_count==0
           last_count=1;
           current_count=0;
       end
       if (current_count+1)==last_count
           current_count=current_count+1;
           if current_count==4
                 delta_T_multi=delta_T_multi+1;
                   if delta_T_multi==9
                       delta_T_multi=1;
                   end
                 current_count=mod(current_count,4);
           end
       else
           current_count=0;
           last_count=0;
       end
           
           
       if judge(3)>0
           %sita=sita+ran_angle;%��������ת�ǶȺ�����������ó�������1
            sita=sita+pi/18.0*delta_T_multi;%��������ת�ǶȺ�����������ó�
           sita=mod(sita,2*pi);
%           ran_angle
%            count 
%            Mem
%            Mem_store(:,count)=Mem';
%            angle_store(count)=pi/18.0;
       else
          % sita=sita-ran_angle;%����1
%             sita=sita-pi/18.0*delta_T_multi;%��������ת�ǶȺ�����������ó�
             sita=sita+pi/18.0*delta_T_multi;%��������ת�ǶȺ�����������ó�
           sita=mod(sita,2*pi);
     %      ran_angle
%            count 
%            Mem
%            Mem_store(:,count)=Mem';
%            angle_store(count)=-pi/18.0;
       end
       %%�����ݶȷ���
       
       sita=cal_grad(xx_t(size_y),yy_t(size_y));
       [tem_coor_x,tem_coor_y]=cal_xy_3(coor_S(size_y,1),coor_S(size_y,2),sita);%ͷ������ϵԭ���ƶ�����
       
        xx_t(size_y)=coor_S(size_y,1)-y_t(size_y)*sin(sita);
        yy_t(size_y)=coor_S(size_y,2)+y_t(size_y)*cos(sita);
            plot(xx_t,yy_t,'w');
         zt2=zt3;
     zt3=cal_T(tem_coor_x,tem_coor_y);%�������ֵ
   
    
   else
           %��������Ĵ���
    for j=1:size_y-1
        coor_S(j,:)=coor_S(j+1,:);%����ϵ�����ƶ�
        x_t(j)=x_t(j+1);%y�Ჽ��
    end
    coor_S(size_y,3)=sita;%ͷ������ϵ�Ƕȸ���
    [coor_S(size_y,1),coor_S(size_y,2)]=cal_xy_3(coor_S(size_y,1),coor_S(size_y,2),coor_S(size_y,3));%ͷ������ϵԭ���ƶ�����
    x_t(size_y)=x_t(size_y)+delta_x;%��������
    x_t=mod(x_t,2*pi/node);%ע�������ԣ���ֹ����Խ��Խ��
    y_t=0.2*sin(node*x_t);%��������ϵ���ڴ�����ϵ�е�λ��
    
    %ת��Ϊ������ϵ����
    for ii=1:size_y
        xx_t(ii)=coor_S(ii,1)-y_t(ii)*sin(coor_S(ii,3));
        yy_t(ii)=coor_S(ii,2)+y_t(ii)*cos(coor_S(ii,3));
    end
      zt2=zt3;
     zt1=cal_T(xx_t(size_y),yy_t(size_y));%����ͷ���¶�ֵ
     zt3=cal_T(coor_S(size_y,1),coor_S(size_y,2));%�������ֵ
   
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
       
   end
  
    plot(xx_t,yy_t,'w');
    axis([0 20 0 20]);
    hold off
    pause(0.01)
end
% Mem_store
% angle_store

function coor_S=init_worm_body(sita,size_y)
    coor_S=zeros(size_y,3);%����ϵ����
    k=tan(sita);
    for i=1:size_y
        coor_S(i,3)=sita;
        coor_S(i,1)=0.2*(i-1);
        coor_S(i,2)=k*coor_S(i,1);
    end


