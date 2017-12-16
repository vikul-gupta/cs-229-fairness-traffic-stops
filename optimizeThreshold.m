function [ best_thresh ] = optimizeThreshold(theta,observationsDEV,stopOutcomeDEV, observationsDEV_nonstd)
%Optimizes TN-FN

prob = computeprobabilities(theta,observationsDEV);
numtrain = 50000;
test = .3:.05:1;
best_thresh = 0;
tnfnvec = zeros(1,length(test));
currentbest = 100000;
for i=1:length(test)
    result = ComputeTestAccuracyEdited(numtrain,observationsDEV_nonstd, observationsDEV, theta,stopOutcomeDEV,[test(i),test(i),test(i),test(i),test(i),test(i),test(i),test(i),test(i),test(i),test(i),test(i),test(i),test(i)]);
    tnfnvec(:,i) = [result(32)]
    if result(32) < currentbest
        currentbest = result(32)
        best_thresh = test(i);
    end
end
            


end

%{
prob = computeprobabilities(theta,observationsTRAIN);
numtrain = 50000;
test = .3:.05:1;
best_thresh = 0;
tnfnvec = zeros(2,length(test));
currentbest = -100000;
for i=1:length(test)
    result = ComputeTestAccuracyEdited(numtrain,observationsTRAIN_nonstd, observationsTRAIN, theta,stopOutcomeTRAIN,[test(i),test(i),test(i),test(i),test(i),test(i)],5,6,7,3,4);
    tnfnvec(:,i) = [result(7);result(6)]
    if result(7)-result(6) > currentbest
        currentbest = result(7)-result(6)
        best_thresh = test(i);
    end
end
            


end

%}