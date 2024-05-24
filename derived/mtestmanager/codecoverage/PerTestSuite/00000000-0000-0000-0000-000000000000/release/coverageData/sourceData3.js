var sourceData3 = {"FileName":"C:\\Users\\wyu\\git\\CICD-200\\gitlab\\samd-with-matlab-test-new\\Algorithms\\ecgClassify.m","RawFileContents":["function [cout, score, h_rate, b_rate, hr_sig, br_sig] = ecgClassify(ecgSignal, sampleRate)\r","\r","persistent jetdata ECGNet\r","if isempty(jetdata)\r","    jetdata = coder.load(\"cmap.mat\");\r","end\r","\r","if isempty(ECGNet)\r","    pwd;\r","    ECGNet = coder.loadDeepLearningNetwork(\"ECGNet.mat\");\r","    % ECGNet = coder.loadDeepLearningNetwork(websave('ECGNet', 'https://winston-appstream.s3.amazonaws.com/SAMD/ECGNet.mat'));\r","    % delete('ECGnet.mat');\r","end\r","\r","% Obtain wavelet coefficients from ECG signal\r","cfs = cwt(ecgSignal,\"VoicesPerOctave\",48);\r","\r","% Obtain scalogram from wavelet coefficients\r","img = ind2rgb(im2uint8(rescale(abs(cfs))), jetdata.cmap);\r","imgCl = im2uint8(imresize(img, [227,227]));\r","\r","% Classifiation model\r","executionMode = \"auto\";\r","if gpuDeviceCount > 0\r","    executionMode = \"gpu\";\r","elseif ~isempty(gcp(\"nocreate\"))\r","    executionMode = \"parallel\";\r","end\r","\r","[cout, cScore] = classify(ECGNet, imgCl, ExecutionEnvironment=executionMode);\r","score = max(cScore);\r","\r","% Heart rate calculation\r","[h_rate, hr_sig] = heartRateCalc(ecgSignal, sampleRate);\r","\r","% Breath rate calculation\r","[b_rate, br_sig] = breathRateCalc(ecgSignal, sampleRate);\r","\r","% Verify classification with machine learning model\r","[cout_ML, ~] = verifyML(ecgSignal);\r","if ~(cout == cout_ML)\r","    cout = \"Error\";\r","end\r","\r","end"],"CoverageDisplayDataPerLine":{"Function":{"LineNumber":1,"Hits":1,"StartColumnNumbers":0,"EndColumnNumbers":91,"ContinuedLine":false},"Statement":[{"LineNumber":3,"Hits":1,"StartColumnNumbers":0,"EndColumnNumbers":25,"ContinuedLine":false},{"LineNumber":4,"Hits":1,"StartColumnNumbers":0,"EndColumnNumbers":19,"ContinuedLine":false},{"LineNumber":5,"Hits":1,"StartColumnNumbers":4,"EndColumnNumbers":37,"ContinuedLine":false},{"LineNumber":8,"Hits":1,"StartColumnNumbers":0,"EndColumnNumbers":18,"ContinuedLine":false},{"LineNumber":9,"Hits":1,"StartColumnNumbers":4,"EndColumnNumbers":8,"ContinuedLine":false},{"LineNumber":10,"Hits":1,"StartColumnNumbers":4,"EndColumnNumbers":57,"ContinuedLine":false},{"LineNumber":16,"Hits":0,"StartColumnNumbers":0,"EndColumnNumbers":42,"ContinuedLine":false},{"LineNumber":19,"Hits":0,"StartColumnNumbers":0,"EndColumnNumbers":57,"ContinuedLine":false},{"LineNumber":20,"Hits":0,"StartColumnNumbers":0,"EndColumnNumbers":43,"ContinuedLine":false},{"LineNumber":23,"Hits":0,"StartColumnNumbers":0,"EndColumnNumbers":23,"ContinuedLine":false},{"LineNumber":24,"Hits":0,"StartColumnNumbers":0,"EndColumnNumbers":21,"ContinuedLine":false},{"LineNumber":25,"Hits":0,"StartColumnNumbers":4,"EndColumnNumbers":26,"ContinuedLine":false},{"LineNumber":26,"Hits":0,"StartColumnNumbers":0,"EndColumnNumbers":32,"ContinuedLine":false},{"LineNumber":27,"Hits":0,"StartColumnNumbers":4,"EndColumnNumbers":31,"ContinuedLine":false},{"LineNumber":30,"Hits":0,"StartColumnNumbers":0,"EndColumnNumbers":77,"ContinuedLine":false},{"LineNumber":31,"Hits":0,"StartColumnNumbers":0,"EndColumnNumbers":20,"ContinuedLine":false},{"LineNumber":34,"Hits":0,"StartColumnNumbers":0,"EndColumnNumbers":56,"ContinuedLine":false},{"LineNumber":37,"Hits":0,"StartColumnNumbers":0,"EndColumnNumbers":57,"ContinuedLine":false},{"LineNumber":40,"Hits":0,"StartColumnNumbers":0,"EndColumnNumbers":35,"ContinuedLine":false},{"LineNumber":41,"Hits":0,"StartColumnNumbers":0,"EndColumnNumbers":21,"ContinuedLine":false},{"LineNumber":42,"Hits":0,"StartColumnNumbers":4,"EndColumnNumbers":19,"ContinuedLine":false}],"Decision":[{"LineNumber":4,"TrueHits":1,"FalseHits":0,"StartColumnNumbers":0,"EndColumnNumbers":19,"ContinuedLine":false},{"LineNumber":8,"TrueHits":1,"FalseHits":0,"StartColumnNumbers":0,"EndColumnNumbers":18,"ContinuedLine":false},{"LineNumber":24,"TrueHits":0,"FalseHits":0,"StartColumnNumbers":0,"EndColumnNumbers":21,"ContinuedLine":false},{"LineNumber":26,"TrueHits":0,"FalseHits":0,"StartColumnNumbers":0,"EndColumnNumbers":32,"ContinuedLine":false},{"LineNumber":41,"TrueHits":0,"FalseHits":0,"StartColumnNumbers":0,"EndColumnNumbers":21,"ContinuedLine":false}],"Condition":[],"MCDC":[]}}