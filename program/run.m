clc;
clear all;
close all;

data1 = importdata('traj1.dat');
data2 = importdata('traj2.dat');
dim = 4;
timestep = 1;
rho = 1;
sigma = 1;

observations =data1;
n = length(data1);

A = 0;
B = 0;
exogenousInput = zeros(n,1);

initialMean = zeros(dim,1);
initialSigma = zeros(dim,dim);

Phi = createPhi(timestep);
Psi = createPsi();
Q = createQ(timestep,sigma);
R = createR(rho);

[X_filtered, Sigma_filtered, X_forecasted, Sigma_forecasted] = ...
    kalman(Phi, A, Q, Psi, B, R, initialMean, initialSigma, observations, exogenousInput);