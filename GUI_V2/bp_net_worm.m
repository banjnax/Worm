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

%  创建一个新的前向神经网络   
net=newff(minmax(P),[5,2],{'tansig','tansig'},'traingdm')  %'purelin'
%  当前输入层权值和阈值   
inputWeights=net.IW{1,1}   
inputbias=net.b{1}   
%  当前网络层权值和阈值   
layerWeights=net.LW{2,1}   
layerbias=net.b{2}   
%  设置训练参数   
net.trainParam.show = 50;   
net.trainParam.lr = 0.05;   
net.trainParam.mc = 0.9;   
net.trainParam.epochs = 5000;   
net.trainParam.goal = 1e-2;   
%  调用 TRAINGDM 算法训练 BP 网络   
[net,tr]=train(net,P,T)


%  对 BP 网络进行仿真  
P=[1;2]
A = sim(net,P)   
%  计算仿真误差   
%E = T - A   
%MSE=mse(E)   
echo off  