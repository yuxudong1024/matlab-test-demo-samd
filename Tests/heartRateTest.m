classdef heartRateTest < matlab.unittest.TestCase
    properties
        ecgData
    end

    properties (TestParameter)
        patientId = num2cell(20:2:146);
    end

    methods(TestClassSetup)
        function loadData(testCase)
            testCase.ecgData = load('ECGData.mat');
        end
    end
    
    methods(Test, TestTags={'signalTest'})
        function testHeartRate(testCase, patientId)
            data = testCase.ecgData;
            signal = data.ECGData.Data(patientId, 1:4096);
            freq = data.Fs;
            fakePatient = patient("first", "last", 1, 1, signal, freq);
            resData = ecgAnalysis(fakePatient);
            heartRate = resData.heartRate;  % Not all heart rates are valid
            verifyGreaterThan(testCase, heartRate, 50);
            verifyLessThan(testCase, heartRate, 200);
        end
    end
    
end