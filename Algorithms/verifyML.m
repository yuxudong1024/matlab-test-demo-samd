function [cout_ML, c_score] = verifyML(ecgSignal)

persistent sf ECGNet
if isempty(sf)
    sf = waveletScattering(SignalLength=numel(ecgSignal));
end
if isempty(ECGNet)
    ECGNet = coder.load("ECGNewModel.mat");
end

% Obtain features from ECG signal
featM = sf.featureMatrix(ecgSignal);

% Classifiation
[c_out, c_score] = ECGNet.ECGNet.predict(array2table(featM'));
cout_ML = c_out(1);
end