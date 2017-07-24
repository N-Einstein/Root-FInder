function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 14-May-2017 23:31:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function equ_Callback(hObject, eventdata, handles)
% hObject    handle to equ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of equ as text
%        str2double(get(hObject,'String')) returns contents of equ as a double


% --- Executes during object creation, after setting all properties.
function equ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to equ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in falsep.
function falsep_Callback(hObject, eventdata, handles)
% hObject    handle to falsep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of falsep


% --- Executes on button press in Bisection.
function Bisection_Callback(hObject, eventdata, handles)
% hObject    handle to Bisection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Bisection


% --- Executes on button press in fixed.
function fixed_Callback(hObject, eventdata, handles)
% hObject    handle to fixed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of fixed


% --- Executes on button press in newton.
function newton_Callback(hObject, eventdata, handles)
% hObject    handle to newton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of newton


% --- Executes on button press in secant.
function secant_Callback(hObject, eventdata, handles)
% hObject    handle to secant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of secant


% --- Executes on button press in bv.
function bv_Callback(hObject, eventdata, handles)
% hObject    handle to bv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bv


% --- Executes on button press in findbutton.
function findbutton_Callback(hObject, eventdata, handles)
% hObject    handle to findbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global row;
row  = 1;
set(handles.table, 'Data', cell(size(get(handles.table,'Data'))));

if ((get(handles.freetxt,'Value') == 1 && get(handles.filetxt,'Value') == 1) || (get(handles.freetxt,'Value') == 0 && get(handles.filetxt,'Value') == 0))
              fprintf('Choose one Option\n');
else
    if get(handles.freetxt,'Value') == 1
        
               x = get(handles.equ,'String');
               if isempty(x)
                 fprintf('Error: Enter Equation first\n');
               else
                 maxp = get(handles.p,'String');
                 maxi = get(handles.i,'String');
               if isempty(maxp) maxp = '0'; end
               if isempty(maxi) maxi = '0'; end
               end
    end
    if get(handles.filetxt,'Value') == 1
        fprintf('fromFile\n');
    end
   
 
     if get(handles.all,'Value') == 1
       
                    in = get(handles.bvin,'String');        
                    in1 = get(handles.false1,'String');
                    in2 = get(handles.false2,'String');
                    in3 = get(handles.bi1,'String');
                    in4 = get(handles.bi2,'String');
                    in5 = get(handles.fixed,'String');
                    in6 = get(handles.newin,'String');
                    in7 = get(handles.sec1,'String');
                    in8 = get(handles.sec2,'String');
       if isempty(in) || isempty(in1) || isempty(in2) || isempty(in3) || isempty(in4) || isempty(in5) || isempty(in6) || isempty(in7) || isempty(in8)
            disp('Enter All initial Values');
       else
      [root,numberofIterations1,time,accuracy,Iterations1, errors1] = BiergeVieta(x,in,maxi,maxp);
        x1 = 0 : numberofIterations1;
       plot1, plot(x1, Iterations1, 'b'); hold on;
        
        data=get(handles.table,'data');
        data{row, 1} = 'BiergeVieta';
        row = row + 1;
                for r = 1 : numberofIterations1
                       data{row,2}= Iterations1(r);
                      if(r > 1) data{row,3}=errors1(r - 1); end;
                      row = row + 1;
                end
        set(handles.table,'data',data);             
         
      [root,numberofIterations2,time,accuracy,Iterations2, errors2] = FalsePosition(x,in1,in2,maxi,maxp);
      if size(Iterations2) > 0
               x2 = 0 : numberofIterations2;
               plot1, plot(x2, Iterations2, 'r'); hold on;

                 data=get(handles.table,'data');
                 data{row, 1} = 'False Position';
                 row = row + 1;
                        for r = 1 : numberofIterations2
                               data{row,2}= Iterations2(r);
                              if(r > 1) data{row,3}=errors2(r - 1); end;
                              row = row + 1;
                        end
                  set(handles.table,'data',data); 
      else
          disp('False Position interval is invalid');
      end
                
     
        
       [root,numberofIterations6,time,accuracy,Iterations6, errors6] = secant(x,in7, in8,maxi,maxp);
        x6 = 0 : numberofIterations6;
        plot1, plot(x6, Iterations6, 'k'); hold on;
        
        data=get(handles.table,'data');
        data{row, 1} = 'Secant';
        row = row + 1;
                for r = 1 : numberofIterations6
                       data{row,2}= Iterations6(r);
                      if(r > 1) data{row,3}=errors6(r - 1); end;
                      row = row + 1;
                end
        set(handles.table,'data',data); 
        
      [root,numberofIterations4,time,accuracy,Iterations4, errors4] = FixedPoint(x,in5,maxi,maxp);
   %    x4 = 0 : numberofIterations4;
    %   plot1, plot(x4, Iterations4, 'm'); hold on;
       
     %  data=get(handles.table,'data');
     %  data{row, 1} = 'Fixed Point';
      % row = row + 1;
       %         for r = 1 : numberofIterations4
        %               data{row,2}= Iterations4(r);
        %              if(r > 1) data{row,3}=errors4(r - 1); end;
        %              row = row + 1;
         %       end
       %set(handles.table,'data',data); 

         
          [roots,All_roots,numberofIterations,time,accuracy,Iterations,Ab_Error]=generalMethod(x,maxi,maxp);
          
             tmp = 1;
             data=get(handles.table,'data');
             data{row, 1} = 'General Method';
             row = row + 1;
             
             for r = 1 : size(roots)
                data{row,2}= roots(r);
                plot1,plot(0, roots(r), 'ks'); hold on;
                row = row + 1;
             end
             
              for r = 1 : size(All_roots)
                         iter = Iterations(tmp : tmp + numberofIterations(r))
                         it = 0 : numberofIterations(r);
                         plot1,plot(it, iter, 'ks'); hold on;
                
                 for i = tmp : tmp + numberofIterations(r)
                         data{row,2}= Iterations(i);
                         if(i > tmp) data{row,3}=Ab_Error(tmp); end;
                         row = row + 1;
                 end 
                 tmp = tmp + numberofIterations(r);
                   data{row,2}= Iterations(i);
              end
         [root,numberofIterations3,time,accuracy,Iterations3, errors3] = Bisection(x,in3,in4,maxi,maxp);
         if(size(Iterations3) > 0)
               x3 = 0 : numberofIterations3;
               plot1, plot(x3, Iterations3, 'g'); hold on;

               data=get(handles.table,'data');
               data{row, 1} = 'Bisection';
               row = row + 1;
                      for r = 1 : numberofIterations3
                              data{row,2}= Iterations3(r);
                             if(r > 1) data{row,3}=errors3(r - 1); end;
                             row = row + 1;
                      end
                      set(handles.table,'data',data); 
         else
             disp('Bisection interval is invalid');
         end
			  
			  
 [root,numberofIterations5,time,accuracy,Iterations5, errors5] = Newton(x,in6,maxi,maxp);
      
        x5 = 0 : size(Iterations5);
       plot1, plot(x5, Iterations5, 'y'); hold on;
        
        data=get(handles.table,'data');
        data{row, 1} = 'General Method';
         row = row + 1;
                for r = 1 : numberofIterations5
                       data{row,2}= Iterations5(r);
                      if(r > 1) data{row,3}=errors5(r - 1); end;
                      row = row + 1;
                end
         set(handles.table,'data',data);    
         
        xlabel('Number of Iterations');
        ylabel('Root found');
        
         x1 = 0 : numberofIterations1 - 1;
         x2 = 0 : numberofIterations2 - 1;
         x3 = 0 : numberofIterations3 - 1;
         x4 = 0 : numberofIterations4 - 1;
         x5 = 0 : numberofIterations5 - 1;
         x6 = 0 : numberofIterations6 - 1;
         x7 = 0 : numberofIterations7 - 1;
        plot2, plot(x1, errors1, 'b'); hold on;
        plot2, plot(x2, errors2, 'r'); hold on;
        plot2, plot(x3, errors3, 'g'); hold on;
       % plot2, plot(x4, errors4, 'm'); hold on;
        plot2, plot(x5, errors5, 'y'); hold on;
        plot2, plot(x6, errors6, 'k'); hold on;
          tmp = 1;
         for r = 1 : All_roots
                         err = Ab_Error(tmp : tmp + numberofIterations(r))
                         it = 0 : numberofIterations(r);
                         plot2,plot(it, err, 'ks'); hold on;
         end
        xlabel('Number of Iterations');
        ylabel('Absolute Error');
       end
   else       
       if get(handles.bv,'Value') == 1
           in = get(handles.bvin,'String');
           if isempty(in)
               fprintf('Error: Enter initial value first\n');
           else
       [root,numberv,time,accuracy,Iterationsv, ev]=BiergeVieta(x,in,maxi,maxp);
        x1 = 0 : numberv;
       plot1, plot(x1, Iterationsv, 'b'); hold on;
                data=get(handles.table,'data');
                data{row, 1} = 'BiergeVieta';
                row = row + 1;
                for r = 1 : numberv
                       data{row,2}= Iterationsv(r);
                      if(r > 1) data{row,3}=ev(r - 1); end;
                      row = row + 1;
                end
                set(handles.table,'data',data);                  
           end
       end
       if get(handles.falsep,'Value') == 1
            in1 = get(handles.false1,'String');
            in2 = get(handles.false2,'String');
           if isempty(in1) || isempty(in2)
               fprintf('Error: Enter initial values first\n');
           else
               [root,number,time,accuracy,Iterations, e]=FalsePosition(x,in1,in2,maxi,maxp);
               disp(size(Iterations));
               if accuracy > 0
                        data=get(handles.table,'data');
                        data{row, 1} = 'FalsePosition';
                        row = row + 1;
                        for r = 1 : number
                               data{row,2}= Iterations(r);
                              if(r > 1) data{row,3}=e(r - 1); end;
                              row = row + 1;
                        end
                        set(handles.table,'data',data); 
               else
                   disp('invalid false Position interval');
               end
           end      
       end
       if get(handles.Bisection,'Value') == 1
            in1 = get(handles.bi1,'String');
            in2 = get(handles.bi2,'String');
           if isempty(in1) || isempty(in2)
               fprintf('Error: Enter initial values first\n');
           else
                [root,numberb,time,accuracy,It, ee]=Bisection(x,in1,in2,maxi,maxp);
                if accuracy > 0
                        data=get(handles.table,'data');
                        data{row, 1} = 'Bisection';
                        row = row + 1;
                        for r = 1 : numberb
                               data{row,2}= It(r);
                              if(r > 1) data{row,3}=ee(r - 1); end;
                              row = row + 1;
                        end
                        set(handles.table,'data',data);
                else
                    disp('wrog bisection Interval');
                end
           end           
       end
       if get(handles.fixed,'Value') == 1
           in = get(handles.fp,'String');
           if isempty(in)
               fprintf('Error: Enter initial value first\n');
           else
               [root,numberf,time,accuracy,If, ef]=FixedPoint(x,in,maxi,maxp);
                data=get(handles.table,'data');
                data{row, 1} = 'Fixed Point';
                row = row + 1;
                for r = 1 : numberf
                       data{row,2}= If(r);
                      if(r > 1) data{row,3}=ef(r - 1); end;
                      row = row + 1;
                end
                set(handles.table,'data',data);
           end

       end
       if get(handles.newton,'Value') == 1
             in = get(handles.newin,'String');
           if isempty(in)
               fprintf('Error: Enter initial value first\n');
           else
              [root,numbern,time,accuracy,In, en]=Newton(x,in,maxi,maxp);
                data=get(handles.table,'data');
                data{row, 1} = 'Newton';
                row = row + 1;
                for r = 1 : size(In)
                       data{row,2}= In(r);
                      if(r > 1) data{row,3}=en(r - 1); end;
                      row = row + 1;
                end
                set(handles.table,'data',data);
           end

       end
       if get(handles.secant,'Value') == 1
             in1 = get(handles.sec1,'String');
             in2 = get(handles.sec2,'String');
           if isempty(in1) || isempty(in2)
               fprintf('Error: Enter initial value first\n');
           else
               [root,numbers,time,accuracy,Is, es]=secant(x,in1,in2,maxi,maxp);
                data=get(handles.table,'data');
                data{row, 1} = 'Secant';
                row = row + 1;
                for r = 1 : numbers
                       data{row,2}= Is(r);
                      if(r > 1) data{row,3}=es(r - 1); end;
                      row = row + 1;
                end
                set(handles.table,'data',data);
           end

       end
        if get(handles.gm,'Value') == 1
             [roots,All_roots,numberofIterations,time,accuracy,Iterations,Ab_Error]=generalMethod(x,maxi,maxp);       
             
            tmp = 1;
             data=get(handles.table,'data');
             data{row, 1} = 'General Method';
             row = row + 1;
             
             for r = 1 : size(roots)
                data{row,2}= roots(r);
                row = row + 1;
             end
 
            for r = 1 : size(All_roots)
                disp(All_roots(r));
                 for i = tmp : tmp + numberofIterations(r)
                     data{row,2}= Iterations(i);
                  if(i > tmp) data{row,3}=Ab_Error(tmp); end;
                  row = row + 1;
                 end 
                 tmp = tmp + numberofIterations(r);
                 row = row + 1;
            end
            
            set(handles.table,'data',data);          
        end
     end
  %   run Out;
   %  h = findobj('Tag','output');
    % data = guidata(h);
     %set(data.res,'string','blabla')
     %guidata(h,data);

end


function i_Callback(hObject, eventdata, handles)
% hObject    handle to i (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of i as text
%        str2double(get(hObject,'String')) returns contents of i as a double


% --- Executes during object creation, after setting all properties.
function i_CreateFcn(hObject, eventdata, handles)
% hObject    handle to i (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p_Callback(hObject, eventdata, handles)
% hObject    handle to p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p as text
%        str2double(get(hObject,'String')) returns contents of p as a double


% --- Executes during object creation, after setting all properties.
function p_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in all.
function all_Callback(hObject, eventdata, handles)
% hObject    handle to all (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of all


% --- Executes on button press in freetxt.
function freetxt_Callback(hObject, eventdata, handles)
% hObject    handle to freetxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of freetxt


% --- Executes on button press in filetxt.
function filetxt_Callback(hObject, eventdata, handles)
% hObject    handle to filetxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of filetxt



function bi1_Callback(hObject, eventdata, handles)
% hObject    handle to bi1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bi1 as text
%        str2double(get(hObject,'String')) returns contents of bi1 as a double


% --- Executes during object creation, after setting all properties.
function bi1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bi1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bi2_Callback(hObject, eventdata, handles)
% hObject    handle to bi2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bi2 as text
%        str2double(get(hObject,'String')) returns contents of bi2 as a double


% --- Executes during object creation, after setting all properties.
function bi2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bi2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function newin_Callback(hObject, eventdata, handles)
% hObject    handle to newin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of newin as text
%        str2double(get(hObject,'String')) returns contents of newin as a double


% --- Executes during object creation, after setting all properties.
function newin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to newin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fp_Callback(hObject, eventdata, handles)
% hObject    handle to fp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fp as text
%        str2double(get(hObject,'String')) returns contents of fp as a double


% --- Executes during object creation, after setting all properties.
function fp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bvin_Callback(hObject, eventdata, handles)
% hObject    handle to bvin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bvin as text
%        str2double(get(hObject,'String')) returns contents of bvin as a double


% --- Executes during object creation, after setting all properties.
function bvin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bvin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in gm.
function gm_Callback(hObject, eventdata, handles)
% hObject    handle to gm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gm



function false1_Callback(hObject, eventdata, handles)
% hObject    handle to false1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of false1 as text
%        str2double(get(hObject,'String')) returns contents of false1 as a double


% --- Executes during object creation, after setting all properties.
function false1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to false1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function false2_Callback(hObject, eventdata, handles)
% hObject    handle to false2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of false2 as text
%        str2double(get(hObject,'String')) returns contents of false2 as a double


% --- Executes during object creation, after setting all properties.
function false2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to false2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sec1_Callback(hObject, eventdata, handles)
% hObject    handle to sec1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sec1 as text
%        str2double(get(hObject,'String')) returns contents of sec1 as a double


% --- Executes during object creation, after setting all properties.
function sec1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sec1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sec2_Callback(hObject, eventdata, handles)
% hObject    handle to sec2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sec2 as text
%        str2double(get(hObject,'String')) returns contents of sec2 as a double


% --- Executes during object creation, after setting all properties.
function sec2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sec2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in file.
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.txt','Select Input File');
ReadFromFile(FileName);   
        

    
