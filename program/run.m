clc;
clear all;
close all;

data1 = importdata('traj1.dat');
data2 = importdata('traj2.dat');

[X_filtered, Sigma_filtered, X_forecasted, Sigma_forecasted] = ...
    kalman(Phi, A, Q, Psi, B, R, initialMean, initialSigma, observations, exogenousInput);