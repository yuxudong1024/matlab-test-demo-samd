function startupScript()

% Download Deep Learning Network and Patient data first
DownloadData();

% Load requirements
slreq.clear();
loadRequirements();

% Open Test Manager
matlabTestManager;

% % Open demo files
% openDemoFiles();

% Check release compatibility, and skip remaining steps if not compatible
if ~checkDemoReleaseCompatibility()
    return;
end

% Open Quality Dashboard
pause(2);
codeQualityDashboard;

end