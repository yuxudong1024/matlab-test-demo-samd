function initSimpleDemo()

foldersToCopy = [ ...
    "Algorithms"; ...
    "Data"; ...
    "EquivTests"; ...
    "Images"; ...
    "Internal"; ...
    "Shortcuts"];

filesToCopy = [ ...
    "README.md"; ...
    "Requirements/ecgRequirements.reqif"; ...
    "Tests/patientTest.m"];

foldersOnPath = [ ...
    "Algorithms"; ...
    "Data"; ...
    "Images"; ...
    "Internal"; ...
    "Requirements"; ...
    "Shortcuts"; ...
    "Tests"];

startupFiles = [ ...
    "Internal/checkForInstalledCompiler.m"; ...
    "Internal/startupScript.m"];
shutdownFiles = "Internal/shutdownScript.m";

% Copy project to a new folder
proj = currentProject();
simpleDemoFolder = fullfile(proj.RootFolder,"..","ECG_Simple");
if isfolder(simpleDemoFolder)
    error("""" + simpleDemoFolder + """ already exists!");
end

mkdir(simpleDemoFolder);
for ii = 1:numel(foldersToCopy)
    src = fullfile(proj.RootFolder,foldersToCopy(ii));
    dest = fullfile(simpleDemoFolder,foldersToCopy(ii));
    copyfile(src,dest,"f");
end
for ii = 1:numel(filesToCopy)
    src = fullfile(proj.RootFolder,filesToCopy(ii));
    dest = fullfile(simpleDemoFolder,filesToCopy(ii));
    destFolder = fileparts(dest);
    if ~isfolder(destFolder)
        mkdir(destFolder);
    end
    copyfile(src,dest,"f");
end

% Get list of all copied files
files = struct2table(dir(fullfile(simpleDemoFolder,"**","*")));
foldersInd = files.isdir | ismember(files.name,[".",".."]);
files(foldersInd,:) = [];
files.path = string(fullfile(files.folder,files.name));

% Delete any requirements files
reqInd = endsWith(files.path,".slmx");
if any(reqInd)
    slmxFiles = files(reqInd,:);
    for ii = 1:height(slmxFiles)
        delete(slmxFiles.path(ii));
    end
    files(reqInd,:) = [];
end

% Close current project
% TODO: Add API call to clear loaded Requirements cache
proj.close();

% Make a new project for the simple demo
simpProj = matlab.project.createProject( ...
    Folder = simpleDemoFolder, ...
    Name = "ECG_Simple");

% Add files to the project
for ii = 1:height(files)
    simpProj.addFile(files.path(ii));
end

% Add folders to simple demo path
for ii = 1:numel(foldersOnPath)
    simpProj.addPath(foldersOnPath(ii));
end

% Remove test label from equivalence tests (for performance)
equivTestsInd = contains(files.path,filesep()+"EquivTests"+filesep());
equivTestFiles = files(equivTestsInd,:);
for ii = 1:height(equivTestFiles)
    f = simpProj.findFile(equivTestFiles.path(ii));
    f.removeLabel("Classification","Test");
end

% Set "Internal" file labels to "Convenience"
internalFilesInd = contains(files.path,filesep()+"Internal"+filesep());
internalFiles = files(internalFilesInd,:);
for ii = 1:height(internalFiles)
    f = simpProj.findFile(internalFiles.path(ii));
    f.addLabel("Classification","Convenience");
end

% Add startup and shutdown scripts
for ii = 1:numel(startupFiles)
    simpProj.addStartupFile(startupFiles(ii));
end
for ii = 1:numel(shutdownFiles)
    simpProj.addShutdownFile(shutdownFiles(ii));
end

% Launch Test Manager
matlabTestManager;
pause(1);

% Launch Code Quality Dashboard
codeQualityDashboard;
% matlabtest.codequalitydashboard.runTestsAndRefreshData;

end

