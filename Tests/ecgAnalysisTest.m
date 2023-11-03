classdef ecgAnalysisTest < matlab.unittest.TestCase
    properties
        fakePatient
    end

    properties (TestParameter)
        invalidPatientList = {'a',1234,"hello",struct.empty()};
    end

    methods(TestClassSetup)
        function createFakePatient(testCase)
            signal = randn(4096, 1);
            freq = 128;
            testCase.fakePatient = patient("first", "last", 1, 1, signal, freq);
        end
    end
    
    methods(TestMethodSetup)
        % Setup for each test
    end
    
    methods(Test)
        function testValidPatient(testCase)
            cmd = @() ecgAnalysis(testCase.fakePatient);
            verifyWarningFree(testCase,cmd)
        end
        function invalidPatientTest(testCase, invalidPatientList)
            cmd = @() ecgAnalysis(invalidPatientList);
            verifyError(testCase,cmd,'ecgAnalysis:InvalidPatient')
        end
    end
    
end