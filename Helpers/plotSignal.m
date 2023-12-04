function plotSignal(patient)
    assert(isstruct(patient), 'plotSignal:invalidStruct', ...
        "Input argument must be a structure with ECG data")
    signal = patient.data.signal;
    time = patient.data.time;

    minPeakSamples = 50;
    minPeakHeight = 0.3;
    u = signal./max(signal);
    [~, idx] = findpeaks(u, 'MinPeakHeight', minPeakHeight, 'MinPeakDistance', minPeakSamples);
    
    plot(time, u)
    hold on
    plot(time(idx), u(idx), 'v', MarkerFaceColor=[0.8500, 0.3250, 0.0980], MarkerSize=7.5)
    hold off
    t = title('ECG Signal', ['Patient ID: ', num2str(patient.id)]);
    t.FontSize = 16;
    t.FontAngle = 'italic';
    grid on
    xlabel("Time")
    ylabel("Normalized Amplitude")
end