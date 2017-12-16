%%data to be operated on
data = T;
outcomeCol = 21;

%%eliminate those rows without 'stop outcome'
missingVec = ismissing(data(:,outcomeCol));
missingIndices = find(missingVec);
data(missingIndices,:) = [];

%establishes response vector, 'stopOutcome'
binCategoricaledited;


%establishes feature vectors
%{
feature1 = fipsOutcome;
feature2 = genderOutcome;
feature3 = raceOutcome;

%% want this for later
racecopy = feature3;
feature4 = violationOutcome;
feature5 = ageOutcome;
feature6 = durationOutcome;
%}
%standardizes feature vectors
%{
feature1 = 1/nanstd(feature1)*(feature1 - nanmean(feature1)*ones(length(feature1),1));
feature2 = 1/nanstd(feature2)*(feature2 - nanmean(feature2)*ones(length(feature2),1));
feature3 = 1/nanstd(feature3)*(feature3 - nanmean(feature3)*ones(length(feature3),1));
feature4 = 1/nanstd(feature4)*(feature4 - nanmean(feature4)*ones(length(feature4),1));
feature5 = 1/nanstd(feature5)*(feature5 - nanmean(feature5)*ones(length(feature5),1));
feature6 = 1/nanstd(feature6)*(feature6 - nanmean(feature6)*ones(length(feature6),1));
%}


fipsOutcome_std = 1/nanstd(fipsOutcome)*(fipsOutcome - nanmean(fipsOutcome)*ones(length(fipsOutcome),1));
femaleOutcome_std = 1/nanstd(femaleOutcome)*(femaleOutcome - nanmean(femaleOutcome)*ones(length(femaleOutcome),1));
maleOutcome_std = 1/nanstd(maleOutcome)*(maleOutcome - nanmean(maleOutcome)*ones(length(maleOutcome),1));
whiteOutcome_std = 1/nanstd(whiteOutcome)*(whiteOutcome - nanmean(whiteOutcome)*ones(length(whiteOutcome),1));
blackOutcome_std = 1/nanstd(blackOutcome)*(blackOutcome - nanmean(blackOutcome)*ones(length(blackOutcome),1));
hispanicOutcome_std = 1/nanstd(hispanicOutcome)*(hispanicOutcome - nanmean(hispanicOutcome)*ones(length(hispanicOutcome),1));
asianOutcome_std = 1/nanstd(asianOutcome)*(asianOutcome - nanmean(asianOutcome)*ones(length(asianOutcome),1));
raceOtherOutcome_std = 1/nanstd(raceOtherOutcome)*(raceOtherOutcome - nanmean(raceOtherOutcome)*ones(length(raceOtherOutcome),1));
speedingOutcome_std = 1/nanstd(speedingOutcome)*(speedingOutcome - nanmean(speedingOutcome)*ones(length(speedingOutcome),1));
movingViolationOutcome_std = 1/nanstd(movingViolationOutcome)*(movingViolationOutcome - nanmean(movingViolationOutcome)*ones(length(movingViolationOutcome),1));
lightsOutcome_std = 1/nanstd(lightsOutcome)*(lightsOutcome - nanmean(lightsOutcome)*ones(length(lightsOutcome),1));
registrationPlatesOutcome_std = 1/nanstd(registrationPlatesOutcome)*(registrationPlatesOutcome - nanmean(registrationPlatesOutcome)*ones(length(registrationPlatesOutcome),1));
safeMovementOutcome_std = 1/nanstd(safeMovementOutcome)*(safeMovementOutcome - nanmean(safeMovementOutcome)*ones(length(safeMovementOutcome),1));
cellPhoneOutcome_std = 1/nanstd(cellPhoneOutcome)*(cellPhoneOutcome - nanmean(cellPhoneOutcome)*ones(length(cellPhoneOutcome),1));
seatBeltOutcome_std = 1/nanstd(seatBeltOutcome)*(seatBeltOutcome - nanmean(seatBeltOutcome)*ones(length(seatBeltOutcome),1));
violationOtherOutcome_std = 1/nanstd(violationOtherOutcome)*(violationOtherOutcome - nanmean(violationOtherOutcome)*ones(length(violationOtherOutcome),1));
age1625Outcome_std = 1/nanstd(age1625Outcome)*(age1625Outcome - nanmean(age1625Outcome)*ones(length(age1625Outcome),1));
age2635Outcome_std = 1/nanstd(age2635Outcome)*(age2635Outcome - nanmean(age2635Outcome)*ones(length(age2635Outcome),1));
age3645Outcome_std = 1/nanstd(age3645Outcome)*(age3645Outcome - nanmean(age3645Outcome)*ones(length(age3645Outcome),1));
age4655Outcome_std = 1/nanstd(age4655Outcome)*(age4655Outcome - nanmean(age4655Outcome)*ones(length(age4655Outcome),1));
age5665Outcome_std = 1/nanstd(age5665Outcome)*(age5665Outcome - nanmean(age5665Outcome)*ones(length(age5665Outcome),1));
age6675Outcome_std = 1/nanstd(age6675Outcome)*(age6675Outcome - nanmean(age6675Outcome)*ones(length(age6675Outcome),1));
age7685Outcome_std = 1/nanstd(age7685Outcome)*(age7685Outcome - nanmean(age7685Outcome)*ones(length(age7685Outcome),1));
ageAbove86Outcome_std = 1/nanstd(ageAbove86Outcome)*(ageAbove86Outcome - nanmean(ageAbove86Outcome)*ones(length(ageAbove86Outcome),1));
stopDuration115Outcome_std = 1/nanstd(stopDuration115Outcome)*(stopDuration115Outcome - nanmean(stopDuration115Outcome)*ones(length(stopDuration115Outcome),1));
stopDuration1630Outcome_std = 1/nanstd(stopDuration1630Outcome)*(stopDuration1630Outcome - nanmean(stopDuration1630Outcome)*ones(length(stopDuration1630Outcome),1));
stopDuration30plusOutcome_std = 1/nanstd(stopDuration30plusOutcome)*(stopDuration30plusOutcome - nanmean(stopDuration30plusOutcome)*ones(length(stopDuration30plusOutcome),1));