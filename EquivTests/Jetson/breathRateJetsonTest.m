classdef breathRateJetsonTest < matlabtest.coder.TestCase

    methods (Test, TestTags={'equivtest'})
        
        function testBreathRate(testCase)
            % Load data
            data = load("ECGData.mat");
            patientId = 64;
            signal = data.ECGData.Data(patientId, 1:4096);
            freq = data.Fs;

            % Configure "lib" target for PIL
            cfg = coder.config("lib");
            cfg.VerificationMode = "PIL";
            cfg.Hardware = coder.Hardware("NVIDIA Jetson");

            % Build code generation artifact
            buildResults = build(testCase, ...
                "breathRateCalc", ...
                Configuration = cfg, ...
                Inputs = {signal,freq});

            % Execute built artifact
            executionResults = execute(testCase, buildResults);

            % Compare against MATLAB execution
            tol = 1e-10;
            verifyExecutionMatchesMATLAB(testCase, executionResults, AbsTol=tol);
        end
    end
end
