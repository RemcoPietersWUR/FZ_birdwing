function [a]=SetupPitotTube
%Functional Zoology - Pitot tube
%Remco Pieters WUR - April 2017


%% Connect Arduino
%User input COMport and type
if exist('a')==false
    prompt = {'Enter COM-port:','Enter Arduino type:'};
    dlg_title = 'Input Arduino port settings';
    defaultans = {'COM15','uno'};
    answer = inputdlg(prompt,dlg_title,1,defaultans);
    if isempty(answer)
        disp('User selected cancel')
    else
        a=arduino(answer{1,1},answer{2,1});
    end
end