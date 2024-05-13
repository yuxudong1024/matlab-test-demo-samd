function [breathRate, u] = breathRateCalc(in, Fs)

[c, l] = wavedec(in, 8, "sym8");
c(1:l(1)) = 0;
c(l(1)+l(2)+2:end) = 0;
u = waverec(c,l,"sym8");

% Sample rate is 128 Hz, min peak distance assuming max heart rate = 25 bpm
minPeakSamples = 300;
u = u./max(u);  % Normalize the signal
[~, idx] = findpeaks(u, "MinPeakDistance", minPeakSamples);
breathRate = round(mean(60*Fs./diff(idx)));

end
