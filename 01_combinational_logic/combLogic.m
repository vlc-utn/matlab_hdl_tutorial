%% Combinational Logic
% In this example, we setup a basic environment with only combinational
% logic for a MIMO system (Multiple Input, Multiple Output)
clc; clear; close all;

%% Inputs
% Each input should be a column vector, and have the same size
inputA = logical([1 1 1 1 1 1 1 1 1 1 1 1 1 1 1])';
inputB = logical([0 0 0 0 0 0 0 1 1 0 0 0 0 0 0])';
inputC = logical([0 1 1 0 0 0 0 0 0 0 0 0 0 0 0])';

input = [inputA inputB inputC];

% Sample time defines the temporal delay between each input.
sampleTime = 1e-3;

% Defines how many samples are used per clock cycle
% For example, "sampleSize = 8" means that a byte is read each clock cycle.
sampleSize = 1;

%% Simulation time
% Here, we define how long the simulation will run.
numSamples = height(input);
latency = 0;        % Algorithm latency. Delay between input and output
simTime = (numSamples-1)*sampleTime + latency;

%% Run the simulation
model_name = "HDLcombLogic";

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
