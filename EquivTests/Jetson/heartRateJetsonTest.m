classdef (TestTags={'piltest'}) ...
        heartRateJetsonTest < matlabtest.coder.TestCase
    properties
        buildResults
        ecgData
        tol = 1e-6
    end
    
    methods(TestClassSetup)
        function loadData(testCase)
            testCase.ecgData = load('ECGData.mat');
        end
        function generateCode(testCase)
            cfg = coder.config('lib');
            cfg.VerificationMode = "PIL";
            cfg.Hardware = coder.Hardware('NVIDIA Jetson');
            var1 = randn(1,4096);
            var2 = 128;
            testCase.buildResults = build(testCase, "heartRateCalc", ...
                Inputs={var1,var2}, Configuration=cfg);
        end
    end

    properties (TestParameter)
        patientId = {53, 51, 117, 72, 68, 20, 128, 97, 119, 93};
    end

    methods (Test)
        function testHeartRate(testCase, patientId)
            data = testCase.ecgData;
            signal = data.ECGData.Data(patientId, 1:4096);
            freq = data.Fs;
            executionResults = execute(testCase, testCase.buildResults, Inputs={signal,freq});
            verifyExecutionMatchesMATLAB(testCase, executionResults, AbsTol=testCase.tol);
        end
    end
end
