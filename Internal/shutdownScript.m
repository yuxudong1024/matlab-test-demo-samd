allEditor = matlab.desktop.editor.getAll;
for i = 1:numel(allEditor)
    allEditor(i).close
end
clear allEditor i