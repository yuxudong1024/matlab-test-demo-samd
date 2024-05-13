function [heartRate, u] = heartRateCalc(u, Fs)

% Detrend the signal
u = detrendingFcn(u);

% Sample rate is 128 Hz, min peak distance assuming max heart rate = 150bpm
minPeakSamples = 50;
minPeakHeight = 0.3;
u = u./max(u);  % Normalize the signal
[~, idx] = findpeaks(u, ...
    MinPeakHeight = minPeakHeight, ...
    MinPeakDistance = minPeakSamples);
heartRate = round(mean(60*Fs./diff(idx)));

end
