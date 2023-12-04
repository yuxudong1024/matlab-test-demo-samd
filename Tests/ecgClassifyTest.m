classdef ecgClassifyTest < matlab.unittest.TestCase
    properties
        ecgData
    end

    properties (TestParameter)
        patientId = num2cell(20:2:60);
    end

    methods(TestClassSetup)
        function loadData(testCase)
            testCase.ecgData = load('ECGData.mat');
        end
    end
    
    methods(Test, TestTags={'classifytest'})
        function validClassifyTest(testCase, patientId)
            data = testCase.ecgData;
            signal = data.ECGData.Data(patientId, 1:4096);
            freq = data.Fs;
            fakePatient = patient("first", "last", 1, 1, signal, freq);
            resData = ecgAnalysis(fakePatient);
            classOut = resData.label;
            score = resData.score;
            if ~ischar(classOut)
                classOut = char(classOut);
            end
            verifyEqual(testCase, classOut, 'ARR')
            verifyGreaterThanOrEqual(testCase, score, 0.999)
        end
    end
    
end