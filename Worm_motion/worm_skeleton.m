%���ܣ�ģ���߳��ת���˶�
function worm_motion()
clc
clear
body=0:.5:5;%�൱���߳�������Ĺؽڵ�,Ϊ�߳泤��
node=4;%�߳�ؽڵ㣬�������˶�
delta_x=0.2;%����
height=0.5;%���
sita=pi/6.0;%�߳��˶�����
[size_x size_y]=size(body);
x_t=zeros(1,size_y);%��λ�Ĵ���
sita_t=zeros(1,size_y);%�Ƕ���λ�Ĵ���
coor_S=init_worm_body(sita,size_y);%��ʼ���߳�λ��
count=0;%������
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
    %���¼Ĵ���
    for j=1:size_y-1
        coor_S(j,:)=coor_S(j+1,:);%����ϵ�����ƶ�
        x_t(j)=x_t(j+1);%y�Ჽ��
    end
    [coor_S(size_y,1),coor_S(size_y,2)]=cal_xy_3(coor_S(size_y,1),coor_S(size_y,2),coor_S(size_y,3));%ͷ������ϵԭ���ƶ�����
    coor_S(size_y,3)=sita;%ͷ������ϵ�Ƕȸ���
    
    x_t(size_y)=x_t(size_y)+delta_x;%��������
    x_t=mod(x_t,2*pi/node);%ע�������ԣ���ֹ����Խ��Խ��
    
    y_t=height*sin(node*x_t);%��������ϵ���ڴ�����ϵ�е�λ��
    
    %ת��Ϊ������ϵ����
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
   coor_S=zeros(size_y,3);%����ϵ����
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
