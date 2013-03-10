function [ X_fi, Sigma_fi, X_fo, Sigma_fo ] = kalman( Phi, A, Q, Psi, B, R, initialMean, initialSigma, observations, exogenousInput )

n = length(observations);
dim = length(initialMean);

X_filtered = initialMean;
Sigma_filtered = initialSigma;

X_fi = zeros(n,dim);
X_fo = zeros(n,dim);
Sigma_fi = zeros(n,dim*dim);
Sigma_fo = zeros(n,dim*dim);

for i = 1:n
    X_forecasted = Phi*X_filtered+A*(exogenousInput(i,:)');
    Sigma_forecasted = Phi*Sigma_filtered*Phi'+Q;
    
    X_fo(i,:) = X_forecasted';
    Sigma_fo(i,:) = reshape(Sigma_forecasted,1,dim*dim);
    
    Kt = Sigma_forecasted*Psi'/(Psi*Sigma_forecasted*Psi'+R);
    X_filtered = X_forecasted + Kt*((observations(i,:)')-Psi*X_forecasted-B*(exogenousInput(i,:)'));
    Sigma_filtered = Sigma_forecasted - Kt*Psi*Sigma_forecasted;
    
    X_fi(i,:) = X_filtered';
    Sigma_fi(i,:) = reshape(Sigma_filtered,1,dim*dim);
end

end

