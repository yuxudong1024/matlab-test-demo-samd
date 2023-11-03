classdef myPatientTestClass < matlab.unittest.TestCase
    % Comment...
    properties
        vars = {20,1,1:10,1};
    end
    
    methods (Test)
        function test1(testCase)
            cmd = @() patient('oscar','molina',testCase.vars{:});
            verifyWarningFree(testCase, cmd)
        end
        function test2(testCase) % Expected to error out
            cmd = @() patient(12345,'molina',testCase.vars{:});
            verifyError(testCase, cmd, 'patient:InvalidName')
        end
        function test3(testCase)
            cmd = @() patient("oscar",'molina',testCase.vars{:});
            verifyWarningFree(testCase, cmd)
        end
        function test4(testCase) % Expected to error out
            cmd = @() patient('osc4r','m0l1n4',testCase.vars{:});
            verifyError(testCase, cmd, 'patient:InvalidName')
        end
    end

end