%%%% Takes a model's theta vector as input, computes the test set
%%%% probabilities. Outputs numtestx1 size vector
function [prob ] = computeprobabilities( theta, observationsTEST)
numtest = length(observationsTEST);
prob = zeros(numtest,1);
for i=1:numtest
    prob(i) = 1/(1+exp(-dot(theta.',observationsTEST(i,:))));
end
end

