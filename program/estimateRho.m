function [ rho ] = estimateRho( data1, data2 )
%This function estimates rho out of two given observation series.
%The observations have the form data1(i) = x(i) + w1(i) and data2(i) = x(i) + w2(i).
%x(i) denotes the position at time i and w1(i) and w2(i) the corresponding
%white noise. w1(i) and w2(i) are independent.
%Thus by subtracting both series, one obtains diff(i) = w1(i) - w2(i) which
%has two times the variance of the original white noise. By applying the
%standard variance estimator for gaussian variables we finally obtain our
%estimation for rho: rho^2 = (1/(n-1)/2*sum(diff(i)-mean(diff)))^2
%

data1 = reshape(data1,numel(data1),1);
data2 = reshape(data2,numel(data2),1);

n = length(data1);

diff = data1 - data2;

m = mean(diff);

s = sum((diff-m).^2);

rho = sqrt(s/(n-1)/2);

end

