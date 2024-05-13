var sourceData7 = {"FileName":"C:\\Users\\wyu\\git\\CICD-200\\gitlab\\matlab-test-demo-samd\\Algorithms\\verifyML.m","RawFileContents":["function [cout_ML, c_score] = verifyML(ecgSignal)\r","\r","persistent sf ECGNet\r","if isempty(sf)\r","    sf = waveletScattering(SignalLength=numel(ecgSignal));\r","end\r","if isempty(ECGNet)\r","    ECGNet = coder.load(\"ECGNewModel.mat\");\r","end\r","\r","% Obtain features from ECG signal\r","featM = sf.featureMatrix(ecgSignal);\r","\r","% Classifiation\r","[c_out, c_score] = ECGNet.ECGNet.predict(array2table(featM'));\r","cout_ML = c_out(1);\r","end"],"CoverageDisplayDataPerLine":{"Function":{"LineNumber":1,"Hits":106,"StartColumnNumbers":0,"EndColumnNumbers":49,"ContinuedLine":false},"Statement":[{"LineNumber":3,"Hits":106,"StartColumnNumbers":0,"EndColumnNumbers":20,"ContinuedLine":false},{"LineNumber":4,"Hits":106,"StartColumnNumbers":0,"EndColumnNumbers":14,"ContinuedLine":false},{"LineNumber":5,"Hits":1,"StartColumnNumbers":4,"EndColumnNumbers":58,"ContinuedLine":false},{"LineNumber":7,"Hits":106,"StartColumnNumbers":0,"EndColumnNumbers":18,"ContinuedLine":false},{"LineNumber":8,"Hits":1,"StartColumnNumbers":4,"EndColumnNumbers":43,"ContinuedLine":false},{"LineNumber":12,"Hits":106,"StartColumnNumbers":0,"EndColumnNumbers":36,"ContinuedLine":false},{"LineNumber":15,"Hits":106,"StartColumnNumbers":0,"EndColumnNumbers":62,"ContinuedLine":false},{"LineNumber":16,"Hits":106,"StartColumnNumbers":0,"EndColumnNumbers":19,"ContinuedLine":false}],"Decision":[{"LineNumber":4,"TrueHits":1,"FalseHits":105,"StartColumnNumbers":0,"EndColumnNumbers":14,"ContinuedLine":false},{"LineNumber":7,"TrueHits":1,"FalseHits":105,"StartColumnNumbers":0,"EndColumnNumbers":18,"ContinuedLine":false}],"Condition":[],"MCDC":[]}}