function [ X_filtered, Sigma_filtered, X_forecasted, Sigma_forecasted ] = kalman( Phi, A, Q, Psi, B, R, initialMean, initialSigma, observations, exogenousInput )

n = length(observations);

X_filtered = initialMean;
Sigma_filtered = initialSigma;

for i = 1:n
    X_forecasted = Phi*X_filtered+A*(exogenousInput(i,:)');
    Sigma_forecasted = Phi*Sigma_filtered*Phi'+Q;
    Kt = Sigma_forecasted*Psi'/(Psi*Sigma_forecasted*Psi'+R);
    X_filtered = X_forecasted + Kt*((observations(i,:)')-Psi*X_forecasted-B*(exogenousInput(i,:)'));
    Sigma_filtered = Sigma_forecasted - Kt*Psi*Sigma_forecasted;
end

end

