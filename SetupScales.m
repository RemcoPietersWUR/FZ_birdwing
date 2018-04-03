function [s_L,s_D]=SetupScales
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
 
 %Setup scale settings
 fopen(s_L);
 fprintf(s_L,'0S'); %print unstable data
 fprintf(s_L,'CA'); %continous auto print
 fprintf(s_L,'0M'); %gram mode
 fclose(s_L);
 fopen(s_D);
 fprintf(s_D,'0S'); %print unstable data
 fprintf(s_D,'CA'); %continous auto print
 fprintf(s_D,'0M'); %gram mode
 fclose(s_D);
 pause(1)
end
 