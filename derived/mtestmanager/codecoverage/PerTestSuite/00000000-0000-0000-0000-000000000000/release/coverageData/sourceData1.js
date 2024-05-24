var sourceData1 = {"FileName":"C:\\Users\\wyu\\git\\CICD-200\\gitlab\\samd-with-matlab-test-new\\Algorithms\\detrendingFcn.m","RawFileContents":["function y = detrendingFcn(u)\r","\r","% Decompose Signal using the MODWT\r","levelForReconstruction = [false, true, true, true, true,false, false, false];\r","\r","% Perform the decomposition using modwt\r","wt = modwt(u, \"sym4\", 7);\r","\r","% Construct MRA matrix using modwtmra\r","mra = modwtmra(wt, \"sym4\");\r","\r","% Sum along selected multiresolution signals\r","y = sum(mra(levelForReconstruction,:),1);\r","\r","end"],"CoverageDisplayDataPerLine":{"Function":{"LineNumber":1,"Hits":0,"StartColumnNumbers":0,"EndColumnNumbers":29,"ContinuedLine":false},"Statement":[{"LineNumber":4,"Hits":0,"StartColumnNumbers":0,"EndColumnNumbers":77,"ContinuedLine":false},{"LineNumber":7,"Hits":0,"StartColumnNumbers":0,"EndColumnNumbers":25,"ContinuedLine":false},{"LineNumber":10,"Hits":0,"StartColumnNumbers":0,"EndColumnNumbers":27,"ContinuedLine":false},{"LineNumber":13,"Hits":0,"StartColumnNumbers":0,"EndColumnNumbers":41,"ContinuedLine":false}],"Decision":[],"Condition":[],"MCDC":[]}}