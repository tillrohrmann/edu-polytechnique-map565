function [ Phi ] = createPhi( timestep )
% This function creates the matrix phi as specified in the report.
%

Phi = eye(4);
Phi(1,3) = timestep;
Phi(2,4) = timestep;

end

