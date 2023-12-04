function p = patient(first, last, age, id, signal, freq)
    
    p = struct;
    p.first = "";
    p.last = "";
    p.age = 0;
    p.id = 0;
    p.processed = false;
    
    % Setup assertions
    firstCond = ischar(first) || isstring(first);
    lastCond = ischar(last) || isstring(last);
    nameCond = firstCond && lastCond;
    
    % Check if input arguments are valid
    assert(nameCond, ...
        'patient:InvalidName', 'Invalid patient''s name found')
    assert(isalpha(first) && isalpha(last), ...
        'patient:InvalidName', 'Invalid patient''s name found')
    assert(isnumeric(age) && age >= 0 && age <= 150, ...
        'patient:InvalidAge', 'Patient''s age must be between 0 and 150')
    assert(isnumeric(id) && mod(id,1) == 0 && id > 0, ...
        'patient:InvalidId', 'Patient''s ID must be an integer greater than 0')
    assert(isnumeric(signal) && length(signal) > 1, 'patient:InvalidSignal', ...
        'Signal array must be numeric')
    assert(isscalar(freq) && isnumeric(freq) && freq > 0 && mod(freq, 1) == 0, ...
        'patient:InvalidFreq', ...
        'Signal frequency must be an integer')
    
    % Store patient info
    p.first = first;
    p.last = last;
    p.age = age;
    p.id = id;
    p.data = struct('time',(0:1/freq:(32-1/freq)),'signal',signal,'freq',freq);

end