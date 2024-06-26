%% Test Fixed point optimizer
clc; clear; close all;

inputA = [
    0.1; 0.1; 0.1; 0.1; 0.1;
    exp(1); exp(1); exp(1); exp(1); exp(1);
    0.5; 0.5; 0.5; 0.5; 0.5;
    pi; pi; pi; pi; pi;
    1234567e-12; 1234567e-12; 1234567e-12; 1234567e-12; 1234567e-12;
];

inputB = [
    1; 2; 3; 4; 5;
    1; 2; 3; 4; 5;
    1; 2; 3; 4; 5;
    1; 2; 3; 4; 5;
    1; 2; 3; 4; 5;
];

stopTime = numel(inputA);
