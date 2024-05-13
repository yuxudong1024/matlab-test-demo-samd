function loadRequirements()
proj = currentProject;
reqFile = fullfile(proj.RootFolder,"Requirements","ecgAppReq.slreqx");
slreq.load(reqFile);
end