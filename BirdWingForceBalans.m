%Functional Zoology - Bird Wing Force Balans
%Remco Pieters WUR 2017

%Definitions
Baud = 9600;
Terminator = 'CR/LF';
DataBits = 8;
Parity= 'none';
FlowControl = 'none';


%% Connect Ohaus Pro Scout scale
%driver install needed for intervave
%User input COMport and type
    prompt = {'Enter COM-port Lift:', 'Enter COM-port Drag:'};
    dlg_title = 'Input COM port settings';
    defaultans = {'COM13','COM14'};
    answer = inputdlg(prompt,dlg_title,1,defaultans);
    if isempty(answer)
        disp('User selected cancel')
    else
        COM_L = answer{1,1};
        COM_D = answer{2,1};
    end

 %Open serial port
 s_L = serial(COM_L,'Baudrate',Baud,'DataBits',DataBits,'Parity',Parity,...
     'FlowControl',FlowControl,'Terminator',Terminator);
 s_D = serial(COM_D,'Baudrate',Baud,'DataBits',DataBits,'Parity',Parity,...
     'FlowControl',FlowControl,'Terminator',Terminator);
 
 