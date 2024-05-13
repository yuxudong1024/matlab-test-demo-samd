classdef patientTest < matlab.unittest.TestCase
    properties
        Names
        AgeIndSignalFreq = {20,1,1:600,1};
    end

    properties (TestParameter)
        nameIndex = num2cell(50:5:120);
        validAge = num2cell(0:10:80);
        invalidAge = {-50, -20, 190, 500, 10000, -inf, NaN, struct};
        validId = num2cell(1:1:10);
        invalidId = {'a',"214",struct,"h3ll0"};
        validFreq = num2cell(1:2:20);
        invalidFreq = {0, [2 5 10], -1, 2.2, struct, NaN, inf, -inf};
        invalidSig = {0, struct, 'aaa'};
    end

    methods(TestClassSetup)
        function loadData(testCase)
            nameData = load('nameslist.mat','nameslist');
            testCase.Names = nameData.nameslist;
        end
    end
    
    methods(Test, TestTags={'partest'})
        function validNameString(testCase, nameIndex)
            firstName = testCase.Names(nameIndex);
            lastName = testCase.Names(nameIndex);
            ageIndSignalFreq = testCase.AgeIndSignalFreq;
            cmd = @() patient(firstName, lastName, ageIndSignalFreq{:});
            verifyWarningFree(testCase, cmd)
        end
        function validNameChar(testCase, nameIndex)
            ageIndSignalFreq = testCase.AgeIndSignalFreq;
            firstName = testCase.Names(nameIndex);
            lastName = testCase.Names(nameIndex);
            cmd = @() patient(char(firstName), char(lastName), ageIndSignalFreq{:});
            verifyWarningFree(testCase, cmd)
        end
        function invalidName(testCase)
            ageIndSignalFreq = testCase.AgeIndSignalFreq;
            cmd = cell(2, 1);
            cmd{1} = @() patient(1234, "last", ageIndSignalFreq{:});
            cmd{2} = @() patient("first", 1234, ageIndSignalFreq{:});
            for i = 1:numel(cmd)
                verifyError(testCase, cmd{i}, 'patient:InvalidName')
            end
        end
        function invalidString(testCase)
            % This should error out because names are not alphabetic
            % strings -- How to fix this test?
            ageIndSignalFreq = testCase.AgeIndSignalFreq;
            cmd{1} = @() patient("f1rst", "last", ageIndSignalFreq{:});
            cmd{2} = @() patient("first", "l4st", ageIndSignalFreq{:});
            cmd{3} = @() patient("f1rst", "l4st", ageIndSignalFreq{:});
            for i = 1:numel(cmd)
                verifyError(testCase, cmd{i}, 'patient:InvalidName')
            end
        end
        function validAgeTest(testCase, validAge)
            ageIndSignalFreq = testCase.AgeIndSignalFreq;
            cmd = @() patient("first", "last", validAge, ageIndSignalFreq{2:end});
            verifyWarningFree(testCase, cmd)
        end
        function invalidAgeTest(testCase, invalidAge)
            ageIndSignalFreq = testCase.AgeIndSignalFreq;
            cmd = @() patient("first", "last", invalidAge, ageIndSignalFreq{2:end});
            verifyError(testCase, cmd, 'patient:InvalidAge')
        end
        function validIdTest(testCase, validId)
            ageIndSignalFreq = testCase.AgeIndSignalFreq;
            cmd = @() patient("first", "last", 1, validId, ageIndSignalFreq{3:end});
            verifyWarningFree(testCase, cmd);
        end
        function invalidIdTest(testCase, invalidId)
            ageIndSignalFreq = testCase.AgeIndSignalFreq;
            cmd = @() patient("first", "last", 1, invalidId, ageIndSignalFreq{3:end});
            verifyError(testCase, cmd, 'patient:InvalidId')
        end
        function validFrequency(testCase, validFreq)
            ageIndSignalFreq = testCase.AgeIndSignalFreq;
            cmd = @() patient("first", "last", ageIndSignalFreq{1:3}, validFreq);
            verifyWarningFree(testCase, cmd)
        end
        function invalidFrequency(testCase, invalidFreq)
            ageIndSignalFreq = testCase.AgeIndSignalFreq;
            cmd = @() patient("first", "last", ageIndSignalFreq{1:3}, invalidFreq);
            verifyError(testCase, cmd, 'patient:InvalidFreq')
        end
        function validSignal(testCase, validFreq)
            signal = randn(4096, 1);
            cmd = @() patient("first", "last", 1, 1, signal, validFreq);
            verifyWarningFree(testCase, cmd)
        end
        function invalidSignal(testCase, invalidSig)
            cmd = @() patient("first", "last", 1, 1, invalidSig, 128);
            verifyError(testCase, cmd, 'patient:InvalidSignal')
        end
    end
    
end