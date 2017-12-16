numtrain = 50000;
numdev = 10000;
numtest = 10000;


feature0 = ones(length(fipsOutcome_std),1);
observations_all = [feature0, fipsOutcome_std,femaleOutcome_std,maleOutcome_std,whiteOutcome_std,blackOutcome_std,...
    hispanicOutcome_std, asianOutcome_std,raceOtherOutcome_std,speedingOutcome_std,movingViolationOutcome_std, ...
    lightsOutcome_std, registrationPlatesOutcome_std, safeMovementOutcome_std, cellPhoneOutcome_std, seatBeltOutcome_std, ...
    violationOtherOutcome_std, age1625Outcome_std, age2635Outcome_std, age3645Outcome_std, age4655Outcome_std, age5665Outcome_std, ...
    age6675Outcome_std, age7685Outcome_std, ageAbove86Outcome_std, stopDuration115Outcome_std, stopDuration1630Outcome_std, stopDuration30plusOutcome_std];
observationsTRAIN = observations_all(1:numtrain,:);
observationsDEV = observations_all(numtrain+1:numtrain+numdev,:);
observationsTEST = observations_all(numtrain+numdev+1:numtrain+numdev+numtest,:);
stopOutcomeTRAIN = stopOutcome(1:numtrain);
stopOutcomeDEV = stopOutcome(numtrain+1:numtrain+numdev);
stopOutcomeTEST = stopOutcome(numtrain+numdev+1:numtrain+numdev+numtest);

    