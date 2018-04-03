function [out_L,out_D]=readScales(s_L,s_D)
%Read-out scale values

%Open serial connection
fopen(s_L);
fopen(s_D);

%Scan serial output
prt_L=fscanf(s_L);
prt_D=fscanf(s_D);

fclose(s_L);
fclose(s_D);

out_L = str2num(prt_L(min(find(isstrprop(prt_L,'digit'))):max(find(isstrprop(prt_L,'digit')))));
out_D = str2num(prt_D(min(find(isstrprop(prt_D,'digit'))):max(find(isstrprop(prt_D,'digit')))));

if isempty(out_L)
    out_L = NaN;
    warndlg('Invalid measurement, L! Try agian')
end
if isempty(out_D)
    out_D = NaN;
    warndlg('Invalid measurement, D! Try agian')
end
end