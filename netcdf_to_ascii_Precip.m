% This code converts NetCdf File Format(.nc) To ASCII text File
% This script requires NCTOOLBOX installed

clear all       %#ok
clc
% Defination of variables
fn=dir('Evaporation, Total precipitation.nc');
fname1=fn.name;
tpr=ncread(fname1,'tp')*1000;
lat=ncread(fname1,'latitude');
lon=ncread(fname1,'longitude');
t=ncread(fname1,'time');
t=datenum(1900,1,1,0,0,0)+double(t)/24;         % In most nc files from ecmwf date origin is 1900/1/1 so it should be modified

% Output file
fid=fopen('TotalPrecipitation.txt','w+');                      % ASCII file with read & write privilege
% Titels
fprintf(fid,'"Title" "Area Series"\n');
fprintf(fid,'"Dim" 2\n');
fprintf(fid,'"Geo" "LONG/LAT" %f %f 0\n',48.0869, 22.0041);         % this cordination defines ORIGIN cordination of model
fprintf(fid,'"Time" "EqudistantTimeAxis" "%s" "%s" %d %d\n',datestr(t(1),'yyyy-mm-dd'),datestr(t(1),'HH:MM:SS'),length(t),(t(2)-t(1))*24*3600);
fprintf(fid,'"NoGridPoints" %d %d\n',length(lon),length(lat));
fprintf(fid,'"Spacing" %g %g\n',abs(lon(2)-lon(1)),abs(lat(2)-lat(1)));
fprintf(fid,'"NoStaticItems" 0\n');
fprintf(fid,'"NoDynamicItems" 1\n');
fprintf(fid,'"Item" "Precipitation Rate" "Precipitation Rate" "mm/h"\n');
fprintf(fid,'NoCustomBlocks 1\n');
fprintf(fid,'"M21_Misc" 1 7 0 0 48.0869 10 0 0 0\n');
fprintf(fid,'"Delete" -1E-035\n');
fprintf(fid,'"DataType" 0\n');
fprintf(fid,'\n');


tic;             % Shows elapsed Time
for i=1:length(t)
    fprintf(fid,'"tstep" %d "item" 1 "layer" 0\n',i-1);
    for j=1:length(lat)
        for k=1:length(lon)
            fprintf(fid,'%f ',(tpr(k,j,i)));
        end
        fprintf(fid,'\n');
    end   
    fprintf(fid,'\n');
end
fclose(fid);
toc;
