function shutdownScript()
allEditorTabs = matlab.desktop.editor.getAll;
for ii = 1:numel(allEditorTabs)
    allEditorTabs(ii).close
end
end