

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
                    ((femaleOutcome(batchindices(j)) ~= femaleOutcome(batchindices(k))) || ...
                    (maleOutcome(batchindices(j)) ~= maleOutcome(batchindices(k))))
                    
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
         for k=j+1:batch
             if (stopOutcome(batchindices(j)) == stopOutcome(batchindices(k))) && ...
                    ((femaleOutcome(batchindices(j)) ~= femaleOutcome(batchindices(k))) || ...
                    (maleOutcome(batchindices(j)) ~= maleOutcome(batchindices(k))))
                counter3 = counter3+1;
                sum3 = sum3 + 2*dot(theta.',observationsTRAIN(batchindices(j),:)-observationsTRAIN(batchindices(k),:));
                sum4 = sum4 + (observationsTRAIN(batchindices(j),:)-observationsTRAIN(batchindices(k),:));
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





