function patientList = buildPatientList

    load('nameslist.mat','nameslist')
    ecgData = load('ECGData.mat');
    
    % Construct object and initialize list
    data = ecgData.ECGData.Data;
    freq = ecgData.Fs;
    
    n = height(data);
    patientList = dictionary(uint32([]), struct.empty());
    
    for id = 1:n
        % Generate random names and patient id's
        age = round(max(20, min(40 + 25.*randn(1), 120)));
        nameIdx = randi([1 100], [2 1]);
        first = nameslist(nameIdx(1), 1);
        last = nameslist(nameIdx(1), 2);
    
        % Extract ECG data based on patient's id
        signal = data(id, 1:4096);
    
        % Create patient object
        patientList(id) = patient(first, last, age, id, signal, freq);
    end

end