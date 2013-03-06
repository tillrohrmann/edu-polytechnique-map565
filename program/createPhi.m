function [ Phi ] = createPhi( timestep )

Phi = eye(4);
Phi(1,3) = timestep;
Phi(2,4) = timestep;

end

