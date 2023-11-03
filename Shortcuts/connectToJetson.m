if ~ismac && (~exist('hwobj','var') || isempty(hwobj))
    hwobj = jetson('gpucoder-tx2-2','ubuntu','ubuntu');
end