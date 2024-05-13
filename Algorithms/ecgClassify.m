function [cout, score, h_rate, b_rate, hr_sig, br_sig] = ecgClassify(ecgSignal, sampleRate)

persistent jetdata ECGNet
if isempty(jetdata)
    jetdata = coder.load("cmap.mat");
end

if isempty(ECGNet)
    pwd;
    ECGNet = coder.loadDeepLearningNetwork("ECGNet.mat");
    % ECGNet = coder.loadDeepLearningNetwork(websave('ECGNet', 'https://winston-appstream.s3.amazonaws.com/SAMD/ECGNet.mat'));
    % delete('ECGnet.mat');
end

% Obtain wavelet coefficients from ECG signal
cfs = cwt(ecgSignal,"VoicesPerOctave",48);

% Obtain scalogram from wavelet coefficients
img = ind2rgb(im2uint8(rescale(abs(cfs))), jetdata.cmap);
imgCl = im2uint8(imresize(img, [227,227]));

% Classifiation model
executionMode = "auto";
if gpuDeviceCount > 0
    executionMode = "gpu";
elseif ~isempty(gcp("nocreate"))
    executionMode = "parallel";
end

[cout, cScore] = classify(ECGNet, imgCl, ExecutionEnvironment=executionMode);
score = max(cScore);

% Heart rate calculation
[h_rate, hr_sig] = heartRateCalc(ecgSignal, sampleRate);

% Breath rate calculation
[b_rate, br_sig] = breathRateCalc(ecgSignal, sampleRate);

% Verify classification with machine learning model
[cout_ML, ~] = verifyML(ecgSignal);
if ~(cout == cout_ML)
    cout = "Error";
end

end