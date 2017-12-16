%{
indexwhite = find(whiteOutcome);
whiteobservationsTRAIN = observationsTRAIN(indexwhite);
whitestopOutcomeTRAIN = stopOutcomeTRAIN(indexwhite);

indexblack = find(blackOutcome);
blackobservationsTRAIN = observationsTRAIN(indexblack);
blackstopOutcomeTRAIN = stopOutcomeTRAIN(indexblack);

hispanicwhite = find(hispanicOutcome);
hispanicobservationsTRAIN = observationsTRAIN(indexhispanic);
hispanicstopOutcomeTRAIN = stopOutcomeTRAIN(indexhispanic);

indexasian = find(asianOutcome);
asianobservationsTRAIN = observationsTRAIN(indexasian);
asianstopOutcomeTRAIN = stopOutcomeTRAIN(indexasian);
%}

%%% manual binary logistic regression implementation with L2 regularization
%%% here we only predict whether a warning, or more serious offence, was
%%% given



%%%%%%%%%%% Parameter Initialization

maxiters = 80000;
learning = 2;   
batch = 20;       %%% Leave on 1 for SGD
%regul = 0; %.00002;  %%% This needs to be carefully checked against the size of data, etc (recommended to run with unregularized, and take lambda 
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
penaltyfactor = .5;   %%% If need to reduce learning rate over time

%individualpenalty = 10^(-5);
%grouppenalty = 0;

%{
numtrain = 100000;
numdev = 10000;
numtest = 10000;
%}

%%%%%%%%%%%%%%%% Set up train/dev/test set
%LogisticRegressionFinalFeaturePrep;
%{
feature0 = ones(length(feature1),1);     %%%% initialize 1's as first feature
observationsTRAIN = [feature0(1:numtrain),feature1(1:numtrain),feature2(1:numtrain),feature3(1:numtrain), ...
    feature4(1:numtrain), feature5(1:numtrain), feature6(1:numtrain)];
racecopyTRAIN = racecopy(1:numtrain);
stopOutcomeTRAIN = stopOutcome(1:numtrain);
observationsDEV = [feature0(numtrain+1:numtrain+numdev),feature1(numtrain+1:numtrain+numdev),feature2(numtrain+1:numtrain+numdev),...
    feature3(numtrain+1:numtrain+numdev), feature4(numtrain+1:numtrain+numdev), feature5(numtrain+1:numtrain+numdev), feature6(numtrain+1:numtrain+numdev)];
stopOutcomeDEV = stopOutcome(numtrain+1:numtrain+numdev);
racecopyDEV = racecopy(numtrain+numdev+1:numtrain+numdev+numtest);
observationsTEST = [feature0(numtrain+numdev+1:numtrain+numdev+numtest),feature1(numtrain+numdev+1:numtrain+numdev+numtest),feature2(numtrain+numdev+1:numtrain+numdev+numtest),...
    feature3(numtrain+numdev+1:numtrain+numdev+numtest), feature4(numtrain+numdev+1:numtrain+numdev+numtest), feature5(numtrain+numdev+1:numtrain+numdev+numtest), feature6(numtrain+numdev+1:numtrain+numdev+numtest)];
stopOutcomeTEST = stopOutcome(numtrain+numdev+1:numtrain+numdev+numtest);
racecopyTEST = racecopy(numtrain+numdev+1:numtrain+numdev+numtest);
%}


%%%% More initialization
theta = zeros(length(observationsTRAIN(1,:)),1);
thetanew = zeros(length(observationsTRAIN(1,:)),1);
thetabest = theta;   %%%%% Including to gaurantee convergence
sumvec = [];
countervec = [];
counterinvvec = [];

%%%%%%%%%%%%%%%% Regression Loop
for i=1:maxiters
    
    batchindices = randi(length(observationsTRAIN(:,1)),batch,1);   %%%%% randomly generate indices for the batch/SGD update
    
    sum1 = zeros(length(observationsTRAIN(1,:)),1);
    
    for j=1:batch 
        sum1 = sum1 + learning * (stopOutcomeTRAIN(batchindices(j)) ...
            - 1/(1+exp(-dot(theta.',observationsTRAIN(batchindices(j),:))))) * ...
            observationsTRAIN(batchindices(j),:).';
    end
    
    
    sum2 = 0;
    counter2 = 0;
    counter2inv = 0;
    if individualpenalty >0
     for j=1:batch
         for k=j+1:batch
             if (stopOutcome(batchindices(j)) == stopOutcome(batchindices(k))) && ...
                    ((age1625Outcome(batchindices(j)) ~= age1625Outcome(batchindices(k))) || ...
                    (age3645Outcome(batchindices(j)) ~= age3645Outcome(batchindices(k))) || ...
                    (age4655Outcome(batchindices(j)) ~= age4655Outcome(batchindices(k))) || ...
                    (age5665Outcome(batchindices(j)) ~= age5665Outcome(batchindices(k))) || ...
                    (age6675Outcome(batchindices(j)) ~= age6675Outcome(batchindices(k))) || ... 
                    (age7685Outcome(batchindices(j)) ~= age7685Outcome(batchindices(k))) || ... 
                    (ageAbove86Outcome(batchindices(j)) ~= ageAbove86Outcome(batchindices(k))))
                counter2 = counter2+1;
                sum2 = sum2 + 2*dot(theta.',observationsTRAIN(batchindices(j),:)-observationsTRAIN(batchindices(k),:))*...
                    (observationsTRAIN(batchindices(j),:)-observationsTRAIN(batchindices(k),:)).';
             end
         end 
     end
     
     if counter2 > 0
         counter2inv = 1/counter2;
     end
    end
    
    countervec = [countervec, counter2];
    counterinvvec = [counterinvvec,counter2inv];
    
    
    sum3 = 0;  %%% a number
    sum4 = 0;
    counter3 = 0;
    counter3inv = 0;
    if grouppenalty >0
          for j=1:batch
         for k=i+1:batch
             if (stopOutcome(batchindices(j)) == stopOutcome(batchindices(k))) && ...
                    ((age1625Outcome(batchindices(j)) ~= age1625Outcome(batchindices(k))) || ...
                    (age3645Outcome(batchindices(j)) ~= age3645Outcome(batchindices(k))) || ...
                    (age4655Outcome(batchindices(j)) ~= age4655Outcome(batchindices(k))) || ...
                    (age5665Outcome(batchindices(j)) ~= age5665Outcome(batchindices(k))) || ...
                    (age6675Outcome(batchindices(j)) ~= age6675Outcome(batchindices(k))) || ... 
                    (age7685Outcome(batchindices(j)) ~= age7685Outcome(batchindices(k))) || ... 
                    (ageAbove86Outcome(batchindices(j)) ~= ageAbove86Outcome(batchindices(k))))
                counter2 = counter2+1;
                sum2 = sum2 + 2*dot(theta.',observationsTRAIN(batchindices(j),:)-observationsTRAIN(batchindices(k),:))*...
                    (observationsTRAIN(batchindices(j),:)-observationsTRAIN(batchindices(k),:)).';
             end
         end 
     end
     if counter3>0
         counter3inv = 1/counter3;
     end 
    end
                
    
    
    
    thetanew = (1-2*regul*learning)*theta + sum1 - individualpenalty*sum2*counter2inv - grouppenalty * sum3*sum4.'*(counter3inv)^2;         %%%%% compute GD step
    if length(find(isnan(thetanew))) >0 
        i
        i
        break
    end
    
    sumvec = [sumvec,sum1]; 
    
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
    if mod(i,2000)==0 
        i
        B = theta;   %%%% needed as input
         
        ComputeTrainLoss;
        trainlossvec = [trainlossvec;trainloss];
        
        if length(trainlossvec) > 1 && abs(trainloss) < abs(trainlossvec(length(trainlossvec)-1))
            thetabest = theta;
        end
        
        ComputeTrainAccuracy;
        trainmissaccvec = [trainmissaccvec, trainacc];
        
        
        %%%%% To avoid dancing around the minimum
        if (length(trainlossvec) > 1) && (abs(trainlossvec(length(trainlossvec))) > abs(trainlossvec(length(trainlossvec)-1)))
            learning = penaltyfactor * learning;
        end
        
    end

    if mod(i,50000)==0 
        %i
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





