%% Example Cosimulation
% In this example, we setup the environment for cosimulatio using the
% Xilinx Vivado HDL Simulator. Then, we compare the results of the Simulink
% environment with the results of Vivado.
clc; clear; close all;

%% Inputs
inputA = logical([1 1 1 1 1 1 1 1 1 1 1 1 1 1 1])';
inputB = logical([0 0 0 0 0 0 0 1 1 0 0 0 0 0 0])';
inputC = logical([0 1 1 0 0 0 0 0 0 0 0 0 0 0 0])';
input = [inputA inputB inputC];

sampleTime = 1;
sampleSize = 1;

%% Simulation time
numSamples = height(input);
latency = 0;        % Algorithm latency. Delay between input and output
simTime = (numSamples-1)*sampleTime + latency;

%% Run the simulation
model_name = "HDLExampleFIL";

load_system(model_name);
simOut = sim(model_name);

simAandB = get(simOut, "AandB");
simAandBData = get(simAandB, "Data");
simAandBData = simAandBData(:);
simAandBTime = get(simAandB, "Time");

simBorC = get(simOut, "BorC");
simBorCData = get(simBorC, "Data");
simBorCData = simBorCData(:);
simBorCTime = get(simBorC, "Time");

%% Compare with MATLAB reference algorithm
assert(isequal(simAandBData, bitand(inputA, inputB)));
assert(isequal(simBorCData, bitor(inputB, inputC)));
disp("Simulation successful!");
