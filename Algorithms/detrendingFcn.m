function y = detrendingFcn(u)

% Decompose Signal using the MODWT
levelForReconstruction = [false, true, true, true, true,false, false, false];

% Perform the decomposition using modwt
wt = modwt(u, "sym4", 7);

% Construct MRA matrix using modwtmra
mra = modwtmra(wt, "sym4");

% Sum along selected multiresolution signals
y = sum(mra(levelForReconstruction,:),1);

end