function varargout = Worm_GUI(varargin)
% WORM_GUI M-file for Worm_GUI.fig
%      WORM_GUI, by itself, creates a new WORM_GUI or raises the existing
%      singleton*.
%
%      H = WORM_GUI returns the handle to a new WORM_GUI or the handle to
%      the existing singleton*.
%
%      WORM_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WORM_GUI.M with the given input arguments.
%
%      WORM_GUI('Property','Value',...) creates a new WORM_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Worm_GUI_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Worm_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help Worm_GUI

% Last Modified by GUIDE v2.5 10-Apr-2015 14:35:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Worm_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Worm_GUI_OutputFcn, ...
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


% --- Executes just before Worm_GUI is made visible.
function Worm_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Worm_GUI (see VARARGIN)

% Choose default command line output for Worm_GUI
%scrsz = get(0,'ScreenSize');
%figure('Position',[1 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2]);
%set(0,'HideUndocumented','off');
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Worm_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Worm_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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
%axes(handles.axes1);
%imshow(a);
axes(handles.axes1);
%get the params
body_c=str2num(get(handles.body,'string'));
node=str2num(get(handles.node,'string'));
height=str2num(get(handles.height,'string'));
sita=str2num(get(handles.angle,'string'));

flag=0;
if get(handles.rb1,'value')
    flag=1;
end
if get(handles.rb2,'value')
    flag=2;
end
if get(handles.rb3,'value')
    flag=3;
end
switch flag
    case 1
        Worm_Skeleton(body_c,node,height,sita,handles);
    case 2
        Worm_Rotation(body_c,node,height,sita,handles);
    case 3
        Worm_Morphing(body_c,node,height,sita,handles);
end

function Worm_Rotation(body_c,node,height,sita,handles)
body=0:body_c:3;%¡ì¨¬¨¬¡ì,¡§¡§
%node=4;%
delta_x=0.1;%¨¬¨¬
%height=0.5;%
%sita=pi/6.0;%¨¬¨¬¡ì
[size_x size_y]=size(body);
x_t=zeros(1,size_y);%
sita_t=zeros(1,size_y);%
coor_S=init_worm_body(sita,size_y);%
mem_size=5;%
Mem=zeros(1,mem_size);%¡§¡§
count=0;%
axes(handles.axes1);
while count<80
    %pause
    pause(0.1)
    count=count+1;
    if count==50
        count
        sita=sita-pi/10;
        coor_S(size_y,1)
    end
    %¡ì
    for j=1:size_y-1
        coor_S(j,:)=coor_S(j+1,:);%¡ì¨¬¡ì
        x_t(j)=x_t(j+1);%y¡ì
    end
    [coor_S(size_y,1),coor_S(size_y,2)]=cal_xy_3(coor_S(size_y,1),coor_S(size_y,2),coor_S(size_y,3));%¨¬¨¬¡ì¡ì
    coor_S(size_y,3)=sita;%¨¬¨¬¡ì¡ì
    
    %¡ì¡ì¡ì
    storepoint_x(count)=coor_S(size_y,1);
    storepoint_y(count)=coor_S(size_y,2);
    
    x_t(size_y)=x_t(size_y)+delta_x;%¡ì
    x_t=mod(x_t,2*pi/node);%¨¬¨¬¡ì
    
    y_t=height*sin(node*x_t);%¡ì¡ì
    
    %¡ì¡ì
    for ii=1:size_y
        xx_t(ii)=coor_S(ii,1)-y_t(ii)*sin(coor_S(ii,3));
        yy_t(ii)=coor_S(ii,2)+y_t(ii)*cos(coor_S(ii,3));
    end
    
     %¡ì
    for jj=1:mem_size-1
        Mem(jj)=Mem(jj+1);
    end
    Mem(mem_size)=0;
   % imshow(a);
    plot(xx_t,yy_t,'b');
    %axis([0 10 0 10]);
    hold on
    %¡ì
    [coor_xx,coor_yy]=draw_Coor(coor_S(size_y,1),coor_S(size_y,2),sita);
    Coor(coor_xx,coor_yy);
    %¡ì¡ì¡ì
    plot(storepoint_x,storepoint_y,'g');
    axis([0 10 0 10]);
    hold off
    %pause(0.1)
end
[coor_xx,coor_yy]=draw_Coor(coor_S(size_y,1),coor_S(size_y,2),sita);
Coor(coor_xx,coor_yy);
plot(storepoint_x,storepoint_y,'g');
plot(xx_t,yy_t,'b');
axis([0 10 0 10]);

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
    
function Worm_Morphing(body_c,node,height,sita,handles)
body=0:body_c:2;%¡ì¨¬¨¬¡ì,¡§¡§
%node=10;%
delta_x=0.1;%¨¬¨¬
%height=0.5;%

%sita=pi/6.0;%¨¬¨¬¡ì
[size_x size_y]=size(body);
x_t=zeros(3,size_y);%
sita_t=zeros(2,size_y);%
coor_S=init_worm_body(sita,size_y);%
mem_size=5;%
Mem=zeros(1,mem_size);%¡§¡§
count=0;%
while count<80
   % pause 
    pause(0.1)
    count=count+1
    if count==20
        height=0.2;
        node=node+2;
    end
    if count==50
        sita=sita-pi/10;
    end
    %¡ì
    for j=1:size_y-1
        coor_S(j,:)=coor_S(j+1,:);%¡ì¨¬¡ì
        x_t(:,j)=x_t(:,j+1);%y¡ì
    end
    [coor_S(size_y,1),coor_S(size_y,2)]=cal_xy_3(coor_S(size_y,1),coor_S(size_y,2),coor_S(size_y,3));%¨¬¨¬¡ì¡ì
    coor_S(size_y,3)=sita;%¨¬¨¬¡ì¡ì
    
    %¡ì¡ì¡ì
    storepoint_x(count)=coor_S(size_y,1);
    storepoint_y(count)=coor_S(size_y,2);
    
    x_t(1,size_y)=x_t(1,size_y)+delta_x;%¡ì
    x_t(2,size_y)=height;%¡ì
    x_t(3,size_y)=node;%node¡ì¡ì
    for i_s=1:size_y
        if x_t(3,i_s)~=0
          x_t(1,i_s)=mod(x_t(1,i_s),2*pi/x_t(3,i_s));%¨¬¨¬¡ì
        end
    end
    y_t=x_t(2,:).*sin(x_t(3,:).*x_t(1,:));%¡ì¡ì
    
    %¡ì¡ì
    for ii=1:size_y
        xx_t(ii)=coor_S(ii,1)-y_t(ii)*sin(coor_S(ii,3));
        yy_t(ii)=coor_S(ii,2)+y_t(ii)*cos(coor_S(ii,3));
    end
    
     %¡ì
    for jj=1:mem_size-1
        Mem(jj)=Mem(jj+1);
    end
    Mem(mem_size)=0;
    
    plot(xx_t,yy_t,'b');
    axis([0 10 0 10]);
    hold on
    
    %¡ì
    [coor_xx,coor_yy]=draw_Coor(coor_S(size_y,1),coor_S(size_y,2),sita);
    Coor(coor_xx,coor_yy);
    %¡ì¡ì¡ì
    plot(storepoint_x,storepoint_y,'g');
    axis([0 10 0 10]);
    hold off
    %pause(0.1)
end
[coor_xx,coor_yy]=draw_Coor(coor_S(size_y,1),coor_S(size_y,2),sita);
Coor(coor_xx,coor_yy);
plot(storepoint_x,storepoint_y,'g');
plot(xx_t,yy_t,'b');
axis([0 10 0 10]);
    
function Worm_Skeleton(body_c,node,height,sita,handles)
cla
body=0:body_c:5;%¨¬¡§¡§¨¬,¡ì¡ì
%node=4;%
delta_x=0.2;%¡§¡§
%height=0.5;%
%sita=pi/6.0;%¡§¡§¨¬
[size_x size_y]=size(body);
x_t=zeros(1,size_y);%
sita_t=zeros(1,size_y);%
coor_S=init_worm_body(sita,size_y);%
count=0;%
while count<15
    pause(0.1)
    hold off
    %pause(0.1)
    count=count+1;
    if count==50
        count
        sita=sita-pi/10;
        coor_S(size_y,1)
        coor_S(size_y,1)*Z_k-Z_err
        coor_S(size_y,1)*Z_k+Z_err
    end
    %¨¬
    for j=1:size_y-1
        coor_S(j,:)=coor_S(j+1,:);%¨¬¡§¨¬
        x_t(j)=x_t(j+1);%y¨¬
    end
    [coor_S(size_y,1),coor_S(size_y,2)]=cal_xy_3(coor_S(size_y,1),coor_S(size_y,2),coor_S(size_y,3));%¡§¡§¨¬¨¬
    coor_S(size_y,3)=sita;%¡§¡§¨¬¨¬
    
    x_t(size_y)=x_t(size_y)+delta_x;%¨¬
    x_t=mod(x_t,2*pi/node);%¡§¡§¨¬
    
    y_t=height*sin(node*x_t);%¨¬¨¬
    
    %¨¬¨¬
    for ii=1:size_y
        xx_t(ii)=coor_S(ii,1)-y_t(ii)*sin(coor_S(ii,3));
        yy_t(ii)=coor_S(ii,2)+y_t(ii)*cos(coor_S(ii,3));
    end
     hold on
    draw_skeleton(xx_t,yy_t,size_y)
    axis([1.5 4 2.5 4.5]);
    hold on
    %pause(0.1)
end
draw_skeleton(xx_t,yy_t,size_y);
axis([1.5 4 2.5 4.5]);

function coor_S=init_worm_body(sita,size_y)
   coor_S=zeros(size_y,3);%¨¬¨¬
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

    
    
    
% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.
function pushbutton1_ButtonDownFcn(hObject, eventdata, handles)

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function Open_Callback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Len_Callback(hObject, eventdata, handles)
% hObject    handle to Len (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Size_Callback(hObject, eventdata, handles)
% hObject    handle to Size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% -------------------------------------------------------------------

% --------------------------------------------------------------------
function Edit_Callback(hObject, eventdata, handles)
% hObject    handle to Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





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




% --- Executes on button press in rb1.
function rb1_Callback(hObject, eventdata, handles)
% hObject    handle to rb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb1




% --------------------------------------------------------------------
function tem_Callback(hObject, eventdata, handles)
% hObject    handle to tem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('Temp');%gui
set(Worm_GUI,'visible','off')%gui



% --------------------------------------------------------------------
function grad_Callback(hObject, eventdata, handles)
% hObject    handle to grad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('Grad');%gui
set(Worm_GUI,'visible','off')%gui



% --------------------------------------------------------------------
function worm_Callback(hObject, eventdata, handles)
% hObject    handle to worm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('Worm');%gui
set(Worm_GUI,'visible','off')%gui




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.sflag=1;
guidata(hObject,handles);




% --------------------------------------------------------------------
function economy_Callback(hObject, eventdata, handles)
% hObject    handle to economy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('Economy');%gui
set(Worm_GUI,'visible','off')%gui

