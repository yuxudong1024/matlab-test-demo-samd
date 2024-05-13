function checkDependencies()
errMsg = strings(0);

% Check for a configured C compiler
cc = mex.getCompilerConfigurations("C");
if isempty(cc)
    errMsg = [errMsg;"<a href=""matlab:matlab.internal.addons.launchers.showExplorer('product',Identifier='ML_MINGW')"">MATLAB Support for MinGW-w64 C/C++/Fortran Compiler</a>"];
end

% Check for MATLAB Coder NVIDIA Support Package
nv = which("jetson");
if isempty(nv)
    errMsg = [errMsg;"<a href=""matlab:matlab.internal.addons.launchers.showExplorer('product',Identifier='NVIDIA')"">MATLAB Coder Support Package for NVIDIA Jetson and NVIDIA DRIVE Platforms</a>"];
end

% If we are missing dependencies, error so it's caught at project startup
if ~isempty(errMsg)
    errMsg = newline() + "Missing dependencies (click to install):" + newline() ...
        + join(">> "+errMsg,newline()) + newline() + newline() ...
        + "NOTE: You will need to restart MATLAB after installing these Add-Ons" + newline();
    error(errMsg);
end

end