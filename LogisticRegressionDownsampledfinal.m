%%% manual binary logistic regression implementation with L2 regularization
%%% here we only predict whether a warning, or more serious offence, was
%%% given

%%%%%%%%%%% Parameter Initialization

maxiters = 150000;
learning = 2;   
batch = 1;  %%% Leave on 1 for SGD
%regul = 0.001; %.00002;  %%% This needs to be carefully checked against the size of data, etc (recommended to run with unregularized, and take lambda 
                 %%% on order of |theta| / maxiters?
epsilon = 0; %%% tolerance
trainlossvec = [];
testlossvec = [];
devlossvec = [];
trainmissaccvec = [];   %%%%% The misclassification percentage
devmissaccvec = [];
testmissaccvec = [];
%theta1 = [];
%testerror=[];
logthreshhold = .6;
penaltyfactor = .96;   %%% If need to reduce learning rate over time


%{
numtrain = 100000;
numdev = 10000;
numtest = 10000;
%}



%%%%%%%%%%%%%%%% Set up train/dev/test set


%LogisticRegressionFinalDownFeaturePrep;  Need to run this first to
%preprocess, but only should do this once


%{
downfeature0 = ones(length(downfeature1),1);  
feature0 = ones(length(feature1),1); 
downobservationsTRAIN = [downfeature0(1:numtrain),downfeature1(1:numtrain),downfeature2(1:numtrain),downfeature3(1:numtrain), ...
    downfeature4(1:numtrain), downfeature5(1:numtrain), downfeature6(1:numtrain)];
downracecopyTRAIN = racecopy(1:numtrain);
downstopOutcomeTRAIN = downstopOutcomeTRAIN(1:numtrain);
observationsDEV = [feature0(numtrain+1:numtrain+numdev),feature1(numtrain+1:numtrain+numdev),feature2(numtrain+1:numtrain+numdev),...
    feature3(numtrain+1:numtrain+numdev), feature4(numtrain+1:numtrain+numdev), feature5(numtrain+1:numtrain+numdev), feature6(numtrain+1:numtrain+numdev)];
stopOutcomeDEV = stopOutcome(numtrain+1:numtrain+numdev);
racecopyDEV = racecopy(numtrain+numdev+1:numtrain+numdev+numtest);
observationsTEST = [feature0(numtrain+numdev+1:numtrain+numdev+numtest),feature1(numtrain+numdev+1:numtrain+numdev+numtest),feature2(numtrain+numdev+1:numtrain+numdev+numtest),...
    feature3(numtrain+numdev+1:numtrain+numdev+numtest), feature4(numtrain+numdev+1:numtrain+numdev+numtest), feature5(numtrain+numdev+1:numtrain+numdev+numtest), feature6(numtrain+numdev+1:numtrain+numdev+numtest)];
stopOutcomeTEST = stopOutcome(numtrain+numdev+1:numtrain+numdev+numtest);
racecopyTEST = racecopy(numtrain+numdev+1:numtrain+numdev+numtest);
%}

%%%%%% Used so loss computation function works ok
observationsTRAIN = observationsTRAIN_down;
stopOutcomeTRAIN =stopOutcomeTRAIN_down;


%racecopyTRAIN = racecopyTRAIN;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%% More initialization
theta = zeros(length(observationsTRAIN_down(1,:)),1);
thetanew = zeros(length(observationsTRAIN_down(1,:)),1);
thetabest = theta;   %%%%% Including to gaurantee convergence
sumvec = [];

%%%%%%%%%%%%%%%% Regression Loop
for i=1:maxiters
    
    batchindices = randi(length(observationsTRAIN_down(:,1)),batch,1);   %%%%% randomly generate indices for the batch/SGD update
    
    sum = zeros(length(observationsTRAIN_down(1,:)),1);
    
    for j=1:batch 
        sum = sum + learning * (stopOutcomeTRAIN_down(batchindices(j)) ...
            - (1)/(1+exp(-1*dot(theta.',observationsTRAIN_down(batchindices(j),:))))) * ...
            observationsTRAIN_down(batchindices(j),:).';
    end
    
    thetanew = (1-2*regul*learning)*theta + sum;         %%%%% compute GD step
    
    
    sumvec = [sumvec,sum]; 
    
    %%%%%% Check for convergence
    error = norm(thetanew-theta);
    if error < epsilon
        i
        error %%% spits out error - if converging too quickly, reduce epsilon
        break
    end
    
    
    %%%%%%% If not converged, reassign thetas
    theta = thetanew;
    
    
    %%%%%%% Compute summary statistics at periodic intervals
    if mod(i,20000)==0 
        
        B = theta;   %%%% needed as input
         
        ComputeTrainLoss;
        trainlossvec = [trainlossvec;trainloss];
        
        if length(trainlossvec) > 1 && abs(trainloss) < abs(trainlossvec(length(trainlossvec)-1))
            thetabest = theta;
        end
        
        %ComputeTrainAccuracy;
        %trainmissaccvec = [trainmissaccvec, trainacc];

        
        %%%%% To avoid dancing around the minimum
        if (length(trainlossvec) > 1) && (abs(trainlossvec(length(trainlossvec))) > abs(trainlossvec(length(trainlossvec)-1)))
            learning = penaltyfactor * learning;
        end
        
    end

    if mod(i,50000)==0 
        
        B = theta;   %%%% needed as input
      
        ComputeDevLoss;
        devlossvec = [devlossvec; devloss];
        %ComputeDevAccuracy;
        %devmissaccvec = [devmissaccvec, devacc];
        
        ComputeTestLoss;
        testlossvec = [testlossvec,testloss];
        %ComputeTestAccuracy;
        %testmissaccvec = [testmissaccvec, testacc];
        
    end
    
    
    
end 



