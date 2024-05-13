classdef heartRateEquivalenceTest < matlabtest.coder.TestCase
    properties
        BuildResults
        ECGData
        Tolerance = 1e-10;
    end

    properties (TestParameter)
        patientId = {53, 51, 117, 72, 68, 20, 128, 97, 119, 93};
    end

    % Load data and generate code only once for all test cases
    methods(TestClassSetup)
        function loadData(testCase)
            testCase.ECGData = load("ECGData.mat");
        end
        function generateCode(testCase)
            % Build target artifact with sample data
            sampleId = testCase.patientId{1};
            sampleSignal = testCase.ECGData.ECGData.Data(sampleId, 1:4096);
            sampleFreq = testCase.ECGData.Fs;
            testCase.BuildResults = build(testCase, ...
                "heartRateCalc", ...
                Configuration = "lib", ...
                Inputs = {sampleSignal,sampleFreq});
        end
    end

    methods (Test, TestTags={'equivtest'})
        function testHeartRate(testCase,patientId)
            % Extract specific data set
            signal = testCase.ECGData.ECGData.Data(patientId, 1:4096);
            freq = testCase.ECGData.Fs;

            % Execute built artifact
            executionResults = execute(testCase, ...
                testCase.BuildResults, ...
                Inputs = {signal,freq});

            % Compare against MATLAB execution
            verifyExecutionMatchesMATLAB(testCase, ...
                executionResults, AbsTol=testCase.Tolerance);
        end
    end
end