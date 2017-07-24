function varargout = fixed(varargin)
% FIXED MATLAB code for fixed.fig
%      FIXED, by itself, creates a new FIXED or raises the existing
%      singleton*.
%
%      H = FIXED returns the handle to a new FIXED or the handle to
%      the existing singleton*.
%
%      FIXED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIXED.M with the given input arguments.
%
%      FIXED('Property','Value',...) creates a new FIXED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fixed_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fixed_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fixed

% Last Modified by GUIDE v2.5 13-May-2017 00:05:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fixed_OpeningFcn, ...
                   'gui_OutputFcn',  @fixed_OutputFcn, ...
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


% --- Executes just before fixed is made visible.
function fixed_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fixed (see VARARGIN)

% Choose default command line output for fixed
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fixed wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fixed_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
