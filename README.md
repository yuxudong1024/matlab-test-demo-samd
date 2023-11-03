# MATLAB Test Demo - Software as a Medical Device (SaMD)

Any algorithms built for safety-critical applications for medical devices require verification and validation.   The formal testing methods are useful not only to ensure the quality of the algorithms developed, but also help us to generate the artifacts required by FDA for IEC 62304 certification or for general-purpose archiving.  In this seminar, using a case study from an AI-enabled wearable ECG monitoring device, we would present a V&V framework that can be applied to any algorithms built in MATLAB.  Specific topics include: 

Highlights:

- Introduction to systematic testing and the MATLAB test framework
- Establishing test-driven development workflows with interactive test authoring, execution, and management tools
- Measuring and optimizing code coverage
- Analyzing code quality and project-level health
- How to perform equivalence testing with generated C/C++ or deployed software components
- Tracing requirements and generating artifacts in support of certified workflows
- Automating MATLAB tests, artifact generation, and deployment in CI/CD systems, e.g. Azure DevOps 

## Overview
In this demo, we demonstrate how MATLAB Test can help manage large unit test suites in a very intuitive manner. The Code Quality Dashboard gives a quick snapshot of the status of the code, unit tests, code coverage, and linking to requirements. In particular, we only show a subset of requirements for demo purposes.

## Instructions
The demo can take a bit to load. Here's what you should expect:

- Main unit tests are linked to MATLAB Project
- Requirements Toolbox and some MATLAB files open up at project start up.  Note that the linking is visible when the files are open.
- Script-based testing of patient.m is the simplest way to introduce MUTF to customers, then explain how to 'convert' the testing script to a class-based test suite.
- You may run the unit test suite live with the MATLAB Test Manager. It should take less than 1 min to complete.
- There are additional (unlinked) demos for equivalence testing in C/C++ for SIL/PIL modes.
- Run equivalence tests for customers interested in or currently using codegen -- warning: these can take more than 5 min to complete.
- PIL mode is designed for NVIDIA Jetson boards so make sure you have connectivity to one such board.

## Dry run

Dry run recording by John Brennan and Oscar Molina is available on this [link](https://mathworks.sharepoint.com/sites/MATLAB-VnV/_layouts/15/stream.aspx?id=%2Fsites%2FMATLAB%2DVnV%2FShared%20Documents%2FMATLAB%20Test%20%2D%20Launch%20Docs%2FRecordings%2FMedical%20Device%20Seminar%20%2D%20Demo%2Emp4&ct=1693230806694&or=Teams-HL&ga=1)

## Required toolboxes
- MATLAB Test
- Statistics and Machine Learning
- Deep Learning Toolbox
- Signal Processing Toolbox
- Wavelet Toolbox

## Authors and acknowledgment
Akhilesh Mishra, Oscar Molina

