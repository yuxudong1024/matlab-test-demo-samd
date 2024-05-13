function  DownloadData()
% Download the large patient data and Deep Learning Networking data from S3

currentfile = mfilename('fullpath');

filepath = fileparts(currentfile);

datafilepath = replace(filepath,'Internal','Data');

ecgnet =  fullfile(datafilepath,'ECGNet');

ecgdata = fullfile(datafilepath,'ECGData');

answer = questdlg('Download the Deep Learning network and patient data?', 'Yes', 'No');

switch answer
    case 'Yes'
        websave(ecgnet, 'https://winston-appstream.s3.amazonaws.com/SAMD/ECGNet.mat');
        websave(ecgdata, 'https://winston-appstream.s3.amazonaws.com/SAMD/ECGData.mat');
    case 'No'
end

