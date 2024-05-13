function connectToJetson()

% Not supported on Mac
if ismac
    return;
end

% Check if hardware object already exists
hwObj = [];
varsInBaseWorkspace = string(evalin("base","who"));
if ~ismember("hwObj",varsInBaseWorkspace) 
    hwObj = evalin("base","hwObj");
end

% Connect if not already connected
if isempty(hwObj)
    hwObj = jetson("gpucoder-tx2-2","ubuntu","ubuntu");
    assignin("base","hwObj",hwObj);
end

end