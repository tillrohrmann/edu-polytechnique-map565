function [ Q ] = createQ( timestep, sigma )

variance = sigma^2;

Q = zeros(4,4);
Q(1,1) = variance*(timestep^4)/4;
Q(1,3) = variance*(timestep^3)/2;
Q(2,2) = variance*(timestep^4)/4;
Q(2,4) = variance*(timestep^3)/2;
Q(3,1) = variance*(timestep^3)/2;
Q(3,3) = variance*(timestep^2);
Q(4,2) = variance*(timestep^3)/2;
Q(4,4) = variance*(timestep^2);

end

