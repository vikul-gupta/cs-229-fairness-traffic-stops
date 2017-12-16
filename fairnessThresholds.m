

% get thresholds for false positive rates
t = theta;
fpRate = ones(15,1)*answer;
columnIndices = [5, 6, 7, 8, 9, 4, 3, 18, 19, 20, 21, 22, 23, 24, 25];
%thetas = [theta, theta, theta, theta, theta, theta, theta, theta, theta,
%theta,...
%          theta, theta, theta, theta, theta];
thresholdsPE = ones(16,1);
for i = 1:length(columnIndices)
    p = computeprobabilities(t, observationsTRAIN);
    FP = [0];
    for j = 1:numtrain
        if p(j) >= 0.5 && stopOutcomeTRAIN(j) == 0 && observationsTRAIN(j, columnIndices(i)) > 0
            FP = [FP, p(j)];
        end
    end
    FP = sort(FP);
    thresholdsPE(i) = FP(int32(fpRate(i)*length(FP)));
end
thresholdsPE(16) = answer;

% get thresholds for statistical parity
spRate = ones(16,1)*0.7;
thresholdsSP = ones(15,1);
for i = 1:length(columnIndices)
    p = computeprobabilities(t, observationsTRAIN);
    SP = [0];
    for j = 1:numtrain
        if p(j) >= 0.5 && observationsTRAIN(j, columnIndices(i)) > 0
            SP = [SP, p(j)];
        end
    end
    SP = sort(SP);
    thresholdsSP(i) = SP(int32(spRate(i)*length(SP)));
    %thresholdsSP(i) = PEThreshold(thetas(i), spRate(i), observationsTRAIN, numtrain);
end
thresholdsSP(16) = answer;

