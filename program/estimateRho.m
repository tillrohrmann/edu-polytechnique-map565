function [ rho ] = estimateRho( data1, data2 )

data1 = reshape(data1,numel(data1),1);
data2 = reshape(data2,numel(data2),1);

n = length(data1);

diff = data1 - data2;

m = mean(diff);

s = sum((diff-m).^2);

rho = sqrt(s/(n-1)/2);

end

