vars = {20,1,1:10,1};
% age, id, signal, freq

%% Test 1: Char-Char (specify...)
patient('oscar','molina',vars{:});

%% Test 2
patient(12345,'molina',vars{:});

%% Test 3
patient("oscar",'molina',vars{:});

%% Test 4
patient('osc4r','m0l1n4',vars{:});

%% Teardown
clear vars
