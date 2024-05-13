classdef breathRateTest < matlab.unittest.TestCase
    properties
        ECGData
    end

    properties (TestParameter)
        patientId = num2cell(15:15:150);
    end

    methods(TestClassSetup)
        function loadData(testCase)
            testCase.ECGData = load("ECGData.mat");
        end
    end
    
    methods(Test, TestTags={'signalTest'})
        function testValidRate(testCase, patientId)
            data = testCase.ECGData;
            signal = data.ECGData.Data(patientId, 1:4096);
            freq = data.Fs;
            fakePatient = patient("first","last",1,1,signal,freq);
            resData = ecgAnalysis(fakePatient);
            breathRate = resData.breathRate;
            verifyGreaterThan(testCase, breathRate, 8);
            verifyLessThan(testCase, breathRate, 25);
        end
        function testInvalidRate(testCase, patientId)
            data = testCase.ECGData;
            signal = data.ECGData.Data(patientId, 1:4096);
            freq = floor(data.Fs*0.1);
            pat = patient("first","last",1,1,signal,freq);
            resData = ecgAnalysis(pat);
            breathRate = resData.breathRate;
            verifyEqual(testCase, breathRate, -1)
        end
    end
end