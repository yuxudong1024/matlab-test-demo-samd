classdef breathRateEquivalenceTest < matlabtest.coder.TestCase

    methods (Test, TestTags={'equivtest'})
        
        function testBreathRate(testCase)
            % Load data
            data = load("ECGData.mat");
            patientId = 64;
            signal = data.ECGData.Data(patientId, 1:4096);
            freq = data.Fs;

            % Build code generation artifact
            buildResults = build(testCase, ...
                "breathRateCalc", ...
                Configuration = "lib", ...
                Inputs = {signal,freq});

            % Execute built artifact
            executionResults = execute(testCase, buildResults);

            % Compare against MATLAB execution
            tol = 1e-10;
            verifyExecutionMatchesMATLAB(testCase, executionResults, AbsTol=tol);
        end
    end
end