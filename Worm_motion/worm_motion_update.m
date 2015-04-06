%���ܣ�������߳���խ�ռ���˶�
function worm_motion()
clc
clear
body=0:.1:2;%�൱���߳�������Ĺؽڵ�,Ϊ�߳泤��
node=10;%�߳�ؽڵ㣬�������˶�
delta_x=0.1;%����
height=0.5;%���

sita=pi/6.0;%�߳��˶�����
[size_x size_y]=size(body);
x_t=zeros(3,size_y);%��λ�Ĵ���
sita_t=zeros(2,size_y);%�Ƕ���λ�Ĵ���
coor_S=init_worm_body(sita,size_y);%��ʼ���߳�λ��
mem_size=5;%����������
Mem=zeros(1,mem_size);%�߳�ĳ��ڼ���
count=0;%������
while count<300
    pause 
    %pause(0.1)
    count=count+1
    if count==20
        height=0.2;
        node=5;
    end
    if count==50
        sita=sita-pi/10;
    end
    %���¼Ĵ���
    for j=1:size_y-1
        coor_S(j,:)=coor_S(j+1,:);%����ϵ�����ƶ�
        x_t(:,j)=x_t(:,j+1);%y�Ჽ��
    end
    [coor_S(size_y,1),coor_S(size_y,2)]=cal_xy_3(coor_S(size_y,1),coor_S(size_y,2),coor_S(size_y,3));%ͷ������ϵԭ���ƶ�����
    coor_S(size_y,3)=sita;%ͷ������ϵ�Ƕȸ���
    
    %�����������ƶ��켣
    storepoint_x(count)=coor_S(size_y,1);
    storepoint_y(count)=coor_S(size_y,2);
    
    x_t(1,size_y)=x_t(1,size_y)+delta_x;%��������
    x_t(2,size_y)=height;%�߶ȸ���
    x_t(3,size_y)=node;%node���£�Ҳ���ǹؽڵ�Ƶ�ʸ���
    
    x_t(1,:)=mod(x_t(1,:),2*pi/node);%ע�������ԣ���ֹ����Խ��Խ��
    
    y_t=x_t(2,:).*sin(x_t(3,:).*x_t(1,:));%��������ϵ���ڴ�����ϵ�е�λ��
    
    %ת��Ϊ������ϵ����
    for ii=1:size_y
        xx_t(ii)=coor_S(ii,1)-y_t(ii)*sin(coor_S(ii,3));
        yy_t(ii)=coor_S(ii,2)+y_t(ii)*cos(coor_S(ii,3));
    end
    
     %���¼�����
    for jj=1:mem_size-1
        Mem(jj)=Mem(jj+1);
    end
    Mem(mem_size)=0;
    
    plot(xx_t,yy_t,'b');
    axis([0 10 0 10]);
    hold on
    
    %������ϵ
    [coor_xx,coor_yy]=draw_Coor(coor_S(size_y,1),coor_S(size_y,2),sita);
    Coor(coor_xx,coor_yy);
    hold on
    Z_err=0.5/cos(pi/6);
    Z_k=tan(pi/6);
    line([0 7.708],[Z_err 7.708*Z_k+Z_err],'color','k');
    hold on
    line([0 7.708],[-Z_err 7.708*Z_k-Z_err],'color','k');
    hold on
    line([coor_xx(3) coor_xx(6)],[coor_yy(3) coor_yy(6)],'color','r');
    hold on
    
    %���������ƶ��켣
    plot(storepoint_x,storepoint_y,'g');
    axis([0 10 0 10]);
    hold off
    %pause(0.1)
end
plot(xx_t,yy_t,'b');
axis([0 10 0 10]);

function coor_S=init_worm_body(sita,size_y)
   coor_S=zeros(size_y,3);%����ϵ����
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
    
