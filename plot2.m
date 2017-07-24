function varargout = plot2(varargin)
% PLOT2 MATLAB code for plot2.fig
%      PLOT2, by itself, creates a new PLOT2 or raises the existing
%      singleton*.
%
%      H = PLOT2 returns the handle to a new PLOT2 or the handle to
%      the existing singleton*.
%
%      PLOT2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLOT2.M with the given input arguments.
%
%      PLOT2('Property','Value',...) creates a new PLOT2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before plot2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to plot2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help plot2

% Last Modified by GUIDE v2.5 08-May-2017 00:30:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @plot2_OpeningFcn, ...
                   'gui_OutputFcn',  @plot2_OutputFcn, ...
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


% --- Executes just before plot2 is made visible.
function plot2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to plot2 (see VARARGIN)

% Choose default command line output for plot2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes plot2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = plot2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
