function compatibleRelease = checkDemoReleaseCompatibility()

releaseIsCompatible = ~feature("webui") || matlabRelease.Release >= "R2025a";

if nargout > 0
    % Just return a compatibility flag
    compatibleRelease = releaseIsCompatible;
    
elseif ~releaseIsCompatible
    % Error in an obvious way
    
    % Pop up a dialog to be super obvious that an error happened
    titleStr = "New Desktop Support";
    msgStr = "This demo does not fully support the new desktop for MATLAB yet." + newline() + newline() ...
        + "Please launch this demo in the standard MATLAB desktop.";
    f = uifigure(Name = "New Desktop Support");
    f.Units = "pixels";
    f.Position(3:4) = [505,240];
    movegui(f,"center");
    uialert(f,msgStr,titleStr, ...
        Icon = "error", ...
        Modal = true, ...
        CloseFcn = @(~,~) delete(f));
    
    % Also throw an error so that it's caught during Project startup
    error(msgStr);
end

end