function varargout = Temp(varargin)
% TEMP M-file for Temp.fig
%      TEMP, by itself, creates a new TEMP or raises the existing
%      singleton*.
%
%      H = TEMP returns the handle to a new TEMP or the handle to
%      the existing singleton*.
%
%      TEMP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEMP.M with the given input arguments.
%
%      TEMP('Property','Value',...) creates a new TEMP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Temp_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Temp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help Temp

% Last Modified by GUIDE v2.5 10-Apr-2015 19:14:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Temp_OpeningFcn, ...
                   'gui_OutputFcn',  @Temp_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Temp is made visible.
function Temp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Temp (see VARARGIN)
%scrsz = get(0,'ScreenSize');
%figure('Position',[1 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2]);
%set(0,'HideUndocumented','off');
set(handles.popupmenu1,'string',{'Gauss-1','Gauss-2','Gauss-3','Custom...'});
axes(handles.axes1);
[x,y]=meshgrid(-1:1.5:20);%
z=hotpot_v2(x,y,1);
%contour(x,y,z,10);
pcolor(x,y,z)
shading interp;
colorbar
handles.pic=1;
handles.fps=[];
handles.store_x=[];
handles.store_y=[];
guidata(hObject,handles);
% Choose default command line output for Temp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Temp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Temp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function per_Callback(hObject, eventdata, handles)
% hObject    handle to per (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of per as text
%        str2double(get(hObject,'String')) returns contents of per as a double


% --- Executes during object creation, after setting all properties.
function per_CreateFcn(hObject, eventdata, handles)
% hObject    handle to per (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
switch get(handles.popupmenu1,'Value')
    case 1
        axes(handles.axes1);
        [x,y]=meshgrid(-1:1.5:20);%
        z=hotpot_v2(x,y,1);
        %contour(x,y,z,20);
        handles.pic=1;
        pcolor(x,y,z)
        shading interp;
        colorbar
        guidata(hObject,handles);
    case 2
        axes(handles.axes1);
        [x,y]=meshgrid(-1:1.5:20);%
        z=hotpot_v2(x,y,2);
        %contour(x,y,z,20);
        pcolor(x,y,z)
        shading interp;
        colorbar
        handles.pic=2;
        guidata(hObject,handles);
    case 3
        axes(handles.axes1);
        [x,y]=meshgrid(-1:1.5:20);%
        z=hotpot_v2(x,y,3);
        %contour(x,y,z,20);
        pcolor(x,y,z)
        shading interp;
        colorbar
        handles.pic=3;
        guidata(hObject,handles);
    case 4
        %run('Custom_Func');
        [handles.pic handles.fps]=Custom_Func();
        guidata(hObject,handles);
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function bt_Callback(hObject, eventdata, handles)
% hObject    handle to bt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bt as text
%        str2double(get(hObject,'String')) returns contents of bt as a double


% --- Executes during object creation, after setting all properties.
function bt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function body_Callback(hObject, eventdata, handles)
% hObject    handle to body (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of body as text
%        str2double(get(hObject,'String')) returns contents of body as a double


% --- Executes during object creation, after setting all properties.
function body_CreateFcn(hObject, eventdata, handles)
% hObject    handle to body (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function node_Callback(hObject, eventdata, handles)
% hObject    handle to node (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of node as text
%        str2double(get(hObject,'String')) returns contents of node as a double


% --- Executes during object creation, after setting all properties.
function node_CreateFcn(hObject, eventdata, handles)
% hObject    handle to node (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function height_Callback(hObject, eventdata, handles)
% hObject    handle to height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of height as text
%        str2double(get(hObject,'String')) returns contents of height as a double


% --- Executes during object creation, after setting all properties.
function height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
%get the params
body_c=str2num(get(handles.body,'string'));
node=str2num(get(handles.node,'string'));
height=str2num(get(handles.height,'string'));
sita=str2num(get(handles.angle,'string'));
sita=str2num(get(handles.angle,'string'));
percent=str2num(get(handles.per,'string'))/100;
best_T=str2num(get(handles.bt,'string'));
life=str2num(get(handles.life,'string'));
%%━━paperregular
%a=imread('back.png');
%imshow(a);

[x,y]=meshgrid(-1:1.5:20);%
z=hotpot_v2(x,y,handles.pic,handles.fps);
%best_T=20;
%z=-abs(z-best_T);
body=0:.2:2;%━：：━,′′
%node=4;%
delta_x=0.1;%：：
%sita=pi/3.0;%：：━
[size_x size_y]=size(body);
x_t=zeros(1,size_y);%
sita_t=zeros(1,size_y);%
coor_S=init_worm_body(sita,size_y);%
zt3=-1000;%：
%axis([-1 20 -1 20]);

mem_size=5;%
Mem=zeros(1,mem_size);
% net=bp_net_worm();
count=0;%

delta_T_multi=1;%
current_count=0;%━：：
last_count=0;%━：：

while 1
   count=count+1
   %a=imread('back.png');
    %imshow(a);
   %imshow(a);
   %contour(x,y,z,10);
   %：：
   pcolor(x,y,z);
   shading interp;
   colorbar
   hold on
   text(2.5,18.5,'Dead','color','w');
   rectangle('Position',[5,18,10,1],'edgecolor','r');
   hold on
   w=9.8-count/life*9.8;
   if w==0
       coor_S(size_y,1)
       coor_S(size_y,2)
       plot(xx_t,yy_t,'w');
       text(8,8,'Dead');
       break
   end
   rectangle('Position',[5.1,18.1,w,0.8],'facecolor','g');
   hold on
    %━━
    for j=1:size_y-1
        coor_S(j,:)=coor_S(j+1,:);%━：━
        x_t(j)=x_t(j+1);%y━
    end
    coor_S(size_y,3)=sita;%：：━━
    [coor_S(size_y,1),coor_S(size_y,2)]=cal_xy_3(coor_S(size_y,1),coor_S(size_y,2),coor_S(size_y,3));%：：━━
    x_t(size_y)=x_t(size_y)+delta_x;%━
    x_t=mod(x_t,2*pi/node);%：：━
    y_t=0.2*sin(node*x_t);%━━
    
    %━━
    for ii=1:size_y
        xx_t(ii)=coor_S(ii,1)-y_t(ii)*sin(coor_S(ii,3));
        yy_t(ii)=coor_S(ii,2)+y_t(ii)*cos(coor_S(ii,3));
    end
    
     zt2=zt3;
     zt1=cal_T_v2(xx_t(size_y),yy_t(size_y),handles.pic,best_T,handles.fps);%：：
     zt3=cal_T_v2(coor_S(size_y,1),coor_S(size_y,2),handles.pic,best_T,handles.fps);%━：：━
   
     %━
    for jj=1:mem_size-1
        Mem(jj)=Mem(jj+1);
    end
    Mem(mem_size)=zt1;
    
   if zt1>=-1&&zt1<=2%
       zt1
       text(8,8,'Bingo');
       coor_S(size_y,1)
       coor_S(size_y,2)
       plot(xx_t,yy_t,'w');
       break
   end
   
    %：：━N━：：
   if last_count~=0
       last_count=mod(last_count+1,5);
   end
   
   if zt2>zt3%━━ 
       
       %ran_angle=rand(1)*pi/2;%━━━：：1
%%━  
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
%        aa = sim(net,Mem1');%
%        aa=int32(aa+0.5);
%        if aa==0
%        sita=sita-pi/18.0;
%        else
%            sita=sita+pi/18.0;
%        end
       
       %：：N
       if last_count==0
           last_count=1;
           current_count=0;
       end
       if (current_count+1)==last_count
           current_count=current_count+1;
           if current_count==4
                 delta_T_multi=delta_T_multi+1;%：：3
                   if delta_T_multi==9
                       delta_T_multi=1;
                   end
                 current_count=mod(current_count,4);
           end
       else
           current_count=0;
           last_count=0;
       end
           
       %：：━━
       v_t(1)=coor_S(size_y,1)-coor_S(size_y-1,1);
       v_t(2)=coor_S(size_y,2)-coor_S(size_y-1,2);
       v_t(3)=0;

       %：：━：：━
       v_t2(1)=cos(sita);
       v_t2(2)=sin(sita);
       v_t2(3)=0;

       judge=cross(v_t,v_t2);%━：：：：━━：：━━,z━0━,z0
       if judge(3)>0
           %sita=sita+ran_angle;%━━：：1
            sita=sita+pi/18.0*delta_T_multi;%━━：：3
            sita=mod(sita,2*pi);
%           ran_angle
%            count 
%            Mem
%            Mem_store(:,count)=Mem';
%            angle_store(count)=pi/18.0;
       else
          % sita=sita-ran_angle;%：：1
%             sita=sita-pi/18.0*delta_T_multi;%━━
            sita=sita-pi/18.0*delta_T_multi;%━━：：3
            sita=mod(sita,2*pi);
     %      ran_angle
%            count 
%            Mem
%            Mem_store(:,count)=Mem';
%            angle_store(count)=-pi/18.0;
       end
       
       %%：：━
       %sita=cal_grad(xx_t(size_y),yy_t(size_y));%：：2━
       if rand<percent%Directivity-L
           sita=(count/life)*8*pi/18+pi/18;
           % sita=sita+pi/18;
       else
           sita=-(count/life)*8*pi/18-pi/18;
           %sita=sita-pi/18;
       end
       %sita=sita+pi/10;%━━
       
   end
   Mem_stores(:,count)=Mem';
  Mem_grad(count)=cal_grad_v2(xx_t(size_y),yy_t(size_y),handles.pic,handles.fps);
      handles.store_x(count)=xx_t(size_y);
   handles.store_y(count)=yy_t(size_y);
    plot(xx_t,yy_t,'w');
    axis([-1 20 -1 20]);
    hold off
    pause(0.01)
end
% Mem_store
% angle_store
save Mem_stores
save Mem_grad
guidata(hObject,handles);
function coor_S=init_worm_body(sita,size_y)
    coor_S=zeros(size_y,3);%━━
    coor_S(1,1)=0;
    coor_S(2,2)=0;
    for i=2:size_y
        coor_S(i,3)=sita;
        [coor_S(i,1) coor_S(i,2)]=cal_Coor(coor_S(i-1,1),coor_S(i-1,2),sita,0.2);
    end



function angle_Callback(hObject, eventdata, handles)
% hObject    handle to angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angle as text
%        str2double(get(hObject,'String')) returns contents of angle as a double


% --- Executes during object creation, after setting all properties.
function angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function life_Callback(hObject, eventdata, handles)
% hObject    handle to life (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of life as text
%        str2double(get(hObject,'String')) returns contents of life as a double


% --- Executes during object creation, after setting all properties.
function life_CreateFcn(hObject, eventdata, handles)
% hObject    handle to life (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --------------------------------------------------------------------
function worm_Callback(hObject, eventdata, handles)
% hObject    handle to worm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('Worm_GUI');%gui
set(Temp,'visible','off')%gui

% --------------------------------------------------------------------
function tem_Callback(hObject, eventdata, handles)
% hObject    handle to tem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function grad_Callback(hObject, eventdata, handles)
% hObject    handle to grad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('Grad');%gui
set(Temp,'visible','off')%gui



% --------------------------------------------------------------------
function economy_Callback(hObject, eventdata, handles)
% hObject    handle to economy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('Economy');%gui
set(Temp,'visible','off')%gui



% --- Executes on button press in showtraces.
function showtraces_Callback(hObject, eventdata, handles)
% hObject    handle to showtraces (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
hold on;
plot(handles.store_x,handles.store_y,'w');
handles.store_x=[];
handles.store_y=[];
guidata(hObject,handles);
