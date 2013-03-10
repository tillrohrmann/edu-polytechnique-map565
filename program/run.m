clc;
clear all;
close all;

data1 = importdata('traj1.dat');
data2 = importdata('traj2.dat');
dim = 4;
timestep = 1;
rho = estimateRho(data1,data2);
sigma = 0.2;
kappa = 10;

% define axis values for the visualization
axisValues =[0 120 0 120];

observations =data1;
n = length(data1);

A = 0;
B = 0;
exogenousInput = zeros(n,1);

initialMean = zeros(dim,1);
initialSigma = kappa^2*eye(4);

Phi = createPhi(timestep);
Psi = createPsi();
Q = createQ(timestep,sigma);
R = createR(rho);

% Kalman filter applied to first trajectory
[X_filtered, Sigma_filtered, X_forecasted, Sigma_forecasted] = ...
    kalman(Phi, A, Q, Psi, B, R, initialMean, initialSigma, observations, exogenousInput);

hold on;
visualize(observations,'o--b');
visualize(X_filtered,'r');
visualize(X_forecasted,'g');
legend('Observations','Estimation','Forecasted');
title('Kalman filter on 1st trajectory');
axis(axisValues);
hold off;

n2= length(data2);
observations2 = data2;

exogenousInput = zeros(n2,1);

% Kalman filter applied to second trajectory
[X_filtered2,Sigma_filtered2,X_forecasted2,Sigma_forecasted2] = ...
    kalman(Phi,A,Q,Psi,B,R,initialMean, initialSigma, observations2, exogenousInput);

figure();

hold on;
visualize(observations2,'o--b');
visualize(X_filtered2,'r');
visualize(X_forecasted2,'g');
legend('Observations','Estimation','Forecasted');
title('Kalman filter on 2nd trajectory');
axis(axisValues);
hold off;

% Since one has two independent observation trajectories one can refine the
% filtered version by computing the average of the observations and to
% apply the Kalman filter on this average. By computing the average one
% also cuts the observation variance by the factor 2 (independence of the white noise).
% and thus one obtains a more accurate filtering.
observations3 = (data1+data2)./2;

% Kalman filter applied to refined observation data
[X_filtered3, Sigma_filtered3, X_forecasted3, Sigma_forecasted3] = ...
    kalman(Phi,A,Q,Psi,B,R, initialMean, initialSigma, observations3, exogenousInput);

figure();

hold on;
visualize(observations3,'o--b');
visualize(X_filtered3,'r');
visualize(X_forecasted3,'g');
legend('Observations','Estimation','Forecasted');
title('Kalman filter on refined trajectory observations');
axis(axisValues);
hold off;

