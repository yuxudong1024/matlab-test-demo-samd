var sourceData5 = {"FileName":"C:\\Users\\wyu\\git\\CICD-200\\gitlab\\samd-with-matlab-test-new\\Algorithms\\isalpha.m","RawFileContents":["function out = isalpha(s)\r","out = false;\r","if ~ischar(s)\r","    s = char(s);\r","end\r","s = upper(s);\r","n = length(s);\r","for i = 1:n\r","    c = s(i);\r","    if (uint8(c) < 65) || (uint8(c) > 90)\r","        return\r","    end\r","end\r","out = true;\r","end\r","\r","function out = isnotalpha(s)\r","out = ~isalpha(s);\r","end"],"CoverageDisplayDataPerLine":{"Function":[{"LineNumber":1,"Hits":190,"StartColumnNumbers":0,"EndColumnNumbers":25,"ContinuedLine":false},{"LineNumber":17,"Hits":0,"StartColumnNumbers":0,"EndColumnNumbers":28,"ContinuedLine":false}],"Statement":[{"LineNumber":2,"Hits":190,"StartColumnNumbers":0,"EndColumnNumbers":12,"ContinuedLine":false},{"LineNumber":3,"Hits":190,"StartColumnNumbers":0,"EndColumnNumbers":13,"ContinuedLine":false},{"LineNumber":4,"Hits":160,"StartColumnNumbers":4,"EndColumnNumbers":16,"ContinuedLine":false},{"LineNumber":6,"Hits":190,"StartColumnNumbers":0,"EndColumnNumbers":13,"ContinuedLine":false},{"LineNumber":7,"Hits":190,"StartColumnNumbers":0,"EndColumnNumbers":14,"ContinuedLine":false},{"LineNumber":8,"Hits":190,"StartColumnNumbers":0,"EndColumnNumbers":11,"ContinuedLine":false},{"LineNumber":9,"Hits":942,"StartColumnNumbers":4,"EndColumnNumbers":13,"ContinuedLine":false},{"LineNumber":10,"Hits":942,"StartColumnNumbers":4,"EndColumnNumbers":41,"ContinuedLine":false},{"LineNumber":11,"Hits":3,"StartColumnNumbers":8,"EndColumnNumbers":16,"ContinuedLine":false},{"LineNumber":14,"Hits":187,"StartColumnNumbers":0,"EndColumnNumbers":11,"ContinuedLine":false},{"LineNumber":18,"Hits":0,"StartColumnNumbers":0,"EndColumnNumbers":18,"ContinuedLine":false}],"Decision":[{"LineNumber":3,"TrueHits":160,"FalseHits":30,"StartColumnNumbers":0,"EndColumnNumbers":13,"ContinuedLine":false},{"LineNumber":8,"TrueHits":942,"FalseHits":187,"StartColumnNumbers":0,"EndColumnNumbers":11,"ContinuedLine":false},{"LineNumber":10,"TrueHits":3,"FalseHits":939,"StartColumnNumbers":4,"EndColumnNumbers":41,"ContinuedLine":false}],"Condition":{"LineNumber":10,"TrueHits":[3,0],"FalseHits":[939,939],"StartColumnNumbers":[8,27],"EndColumnNumbers":[21,40],"ContinuedLine":false},"MCDC":{"LineNumber":10,"ExecutableTestPairs":2,"ExecutedTestPairs":1,"StartColumnNumbers":4,"EndColumnNumbers":41,"ConditionMCDCCov":[{"LineNumber":10,"StartColNumber":9,"EndColNumber":21,"TrueTestPair":"Tx","TrueTestPairCovered":true,"FalseTestPair":"FF","FalseTestPairCovered":true},{"LineNumber":10,"StartColNumber":28,"EndColNumber":40,"TrueTestPair":"(FT)","TrueTestPairCovered":false,"FalseTestPair":"FF","FalseTestPairCovered":true}],"ContinuedLine":false}}}