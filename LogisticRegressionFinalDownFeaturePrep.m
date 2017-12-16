numtrain = 50000;
numdev = 10000;
numtest = 10000;


down_feature0 = ones(length(fipsOutcome_std),1);
%{
observations_all_down = [down_feature0, down_fipsOutcome_std,down_femaleOutcome_std,down_maleOutcome_std,down_whiteOutcome_std,down_blackOutcome_std,...
    down_hispanicOutcome_std, down_asianOutcome_std,down_raceOtherOutcome_std,down_speedingOutcome_std,down_movingViolationOutcome_std, ...
    down_lightsOutcome_std, down_registrationPlatesOutcome_std, down_safeMovementOutcome_std, down_cellPhoneOutcome_std, down_seatBeltOutcome_std, ...
    down_violationOtherOutcome_std, down_age1625Outcome_std, down_age2635Outcome_std, down_age3645Outcome_std, down_age4655Outcome_std, down_age5665Outcome_std, ...
    down_age6675Outcome_std, down_age7685Outcome_std, down_ageAbove86Outcome_std, down_stopDuration115Outcome_std, down_stopDuration1630Outcome_std, down_stopDuration30plusOutcome_std];
%}
observations_all_down =[feature0, fipsOutcome_std,femaleOutcome_std,maleOutcome_std,whiteOutcome_std,blackOutcome_std,...
    hispanicOutcome_std, asianOutcome_std,raceOtherOutcome_std,speedingOutcome_std,movingViolationOutcome_std, ...
    lightsOutcome_std, registrationPlatesOutcome_std, safeMovementOutcome_std, cellPhoneOutcome_std, seatBeltOutcome_std, ...
    violationOtherOutcome_std, age1625Outcome_std, age2635Outcome_std, age3645Outcome_std, age4655Outcome_std, age5665Outcome_std, ...
    age6675Outcome_std, age7685Outcome_std, ageAbove86Outcome_std, stopDuration115Outcome_std, stopDuration1630Outcome_std, stopDuration30plusOutcome_std];

downstopOutcomeTRAIN(removed,:) = [];
observations_all_down(removed,:) = [];

observationsTRAIN_down = observations_all_down(1:numtrain,:);
observationsDEV_down = observations_all(numtrain+1:numtrain+numdev,:);
observationsTEST = observations_all(numtrain+numdev+1:numtrain+numdev+numtest,:);
stopOutcomeTRAIN_down = downstopOutcomeTRAIN(1:numtrain);
stopOutcomeDEV = stopOutcome(numtrain+1:numtrain+numdev);
stopOutcomeTEST = stopOutcome(numtrain+numdev+1:numtrain+numdev+numtest);