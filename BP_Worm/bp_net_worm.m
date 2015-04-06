function net=bp_net_worm()
clc
clear
[P T]=generate();
% [size_x,size_y]=size(P);
% for i=1:size_y
%     for j=1:size_x-1
%         if P(j,i)>P(j+1,i)
%             P(j,i)=1;
%         else
%             P(j,i)=-1;
%         end
%     end
%     if P(size_x,i)>0
%         P(size_x,i)=-1;
%     else
%             P(size_x,i)=1;
%     end
% end
% 
% P
% pause
% 

%  ����һ���µ�ǰ��������   
net=newff(minmax(P),[5,1],{'tansig','tansig','tansig'},'traingdm')  %'purelin'
%  ��ǰ�����Ȩֵ����ֵ   
inputWeights=net.IW{1,1}   
inputbias=net.b{1}   
%  ��ǰ�����Ȩֵ����ֵ   
layerWeights=net.LW{2,1}   
layerbias=net.b{2}   
%  ����ѵ������   
net.trainParam.show = 50;   
net.trainParam.lr = 0.005;   
net.trainParam.mc = 0.9;   
net.trainParam.epochs = 10000;   
net.trainParam.goal = 1e-2;   
%  ���� TRAINGDM �㷨ѵ�� BP ����   
[net,tr]=train(net,P,T);  


%  �� BP ������з���   
A = sim(net,P)   
%  ����������   
E = T - A   
MSE=mse(E)   
echo off  