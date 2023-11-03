% Open script/functions
open("DeepLearningCNN_script.mlx")
open("patient.m")

% Open test suites
open("patientTest.m")
open("breathRateCalc.m")
open("breathRateTest.m")
open("heartRateCalc.m")
open("heartRateTest.m")

% Load patient database
load("Data\patientData.mat")

% Load requirements
cp = currentProject;
reqFile = fullfile(cp.RootFolder,'Requirements','ecgAppReq.slreqx');
fcnReq = slreq.open(reqFile);

% Open dashboard
codeQualityDashboard