function results = ecgAnalysis(patient)

results = struct( ...
    patientId     = 0, ...
    label         = "", ...
    score         = 0, ...
    heartRate     = -1, ...
    breathRate    = -1, ...
    heartRateSig  = [], ...
    breathRateSig = []);

assert(isa(patient,"struct") && checkPatientStruct(patient), ...
    "ecgAnalysis:InvalidPatient", "Input must be a patient object");
results.patientId = patient.id;

signal = patient.data.signal;
freq = patient.data.freq;
[lbl, scr, h_rate, b_rate, hr_sig, br_sig] = ecgClassify(signal, freq);

% Breath rate validation
if ~(b_rate > 8 && b_rate < 25)
    b_rate = -1;
end

% Heart rate validation
if ~(h_rate > 50 && h_rate < 200)
    h_rate = -1;
end

% Save results of ECG analysis
results.label         = string(lbl);
results.score         = double(scr);
results.heartRate     = h_rate;
results.breathRate    = b_rate;
results.heartRateSig  = hr_sig;
results.breathRateSig = br_sig;

end

function out = checkPatientStruct(patient)
out = true;
keys = ["first", "last", "age", "id", "data", "processed"];
for i = 1:numel(keys)
    if ~isfield(patient, keys(i))
        out = false;
    end
end
end
