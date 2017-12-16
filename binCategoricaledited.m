data = T;
miscCategory = zeros(length(data.stop_outcome),1); %% vector will contain 1 if an entry is not one of the given categories

%%bin 'stop outcome' into numerical vars
%% Verbal Warning = 0, Written Warning = 0, Ticket = 1, Summons = 1, Arrest = 1;
stopOutcome = zeros(length(data.stop_outcome),1);
verbal = 0;
written = 0;
ticket = 0;
summons = 0;
arrest = 0;
for i=1:length(stopOutcome)
    temp = data.stop_outcome(i);
    if temp == 'Verbal Warning'
        stopOutcome(i) = 0;
        verbal = verbal + 1;
    else if temp == 'Written Warning'
            stopOutcome(i) = 0;
            written = written + 1;
        else if temp == 'Ticket'
                stopOutcome(i) = 1;
                ticket = ticket+1;
            else if temp == 'Summons'
                    stopOutcome(i)=1;
                    summons = summons+1;
                else if temp =='Arrest'
                        stopOutcome(i) = 1;
                        arrest = arrest+1;
                    else
                        miscCategory(i) = 1;
                    end
                end
            end
        end
    end
end


%{
%%bin 'stop outcome' into numerical vars
%% Verbal Warning = 1, Written Warning = 2, Ticket = 3, Summons = 4, Arrest = 5;
stopOutcome = zeros(length(data.stop_outcome),1);
for i=1:length(stopOutcome)
    temp = data.stop_outcome(i);
    if temp == 'Verbal Warning'
        stopOutcome(i) = 1;
    else if temp == 'Written Warning'
            stopOutcome(i) = 2;
        else if temp == 'Ticket'
                stopOutcome(i) = 3;
            else if temp == 'Summons'
                    stopOutcome(i)=4;
                else if temp =='Arrest'
                        stopOutcome(i) = 5;
                    else
                        miscCategory(i) = 1;
                    end
                end
            end
        end
    end
end
%}

%{
%%bin 'gender' into numerical vars
%% Female = 1, Male = 2
genderOutcome = zeros(length(data.driver_gender),1);
for i=1:length(genderOutcome)
    temp = data.driver_gender(i);
    if temp == 'F'
        genderOutcome(i) = 1;
    else if temp == 'M'
            genderOutcome(i) = 2;
        else
            miscCategory(i) = 1;
            
        end
    end
end
%}
%% Creating female variable  - 1 if female, else 0
femaleOutcome = zeros(length(data.driver_gender),1);
for i=1:length(femaleOutcome)
    temp = data.driver_gender(i);
    if temp == 'F'
        femaleOutcome(i) = 1;
    else if temp == 'M'
            femaleOutcome(i) = 0;
        else
            miscCategory(i) = 1;
            
        end
    end
end

%%Creating male variable - 1 if male, else 0
maleOutcome = zeros(length(data.driver_gender),1);
for i=1:length(maleOutcome)
    temp = data.driver_gender(i);
    if temp == 'F'
        maleOutcome(i) = 0;
    else if temp == 'M'
            maleOutcome(i) = 1;
        else
            miscCategory(i) = 1;
            
        end
    end
end

%{
%%bin 'race' into numerical vars
%% White = 1, Black =2, Hispanic = 3, Asian =4, Other = 5
raceOutcome = zeros(length(data.driver_race),1);
for i=1:length(raceOutcome)
    temp = data.driver_race(i);
    if temp == 'White'
        raceOutcome(i) = 1;
    else if temp == 'Black'
            raceOutcome(i) = 2;
        else if temp == 'Hispanic'
                raceOutcome(i) = 3;
            else if temp == 'Asian'
                    raceOutcome(i)=4;
                else if temp == 'Other'
                        raceOutcome(i) = 5;
                    else
                        miscCategory(i) = 1;
                    end
                end
            end
        end
    end
end
%}
%%Creating White variable - 1 if white, else 0
whiteOutcome = zeros(length(data.driver_race),1);
for i=1:length(whiteOutcome)
    temp = data.driver_race(i);
    if temp == 'White'
        whiteOutcome(i) = 1;
    else if temp == 'Black'
            whiteOutcome(i) = 0;
        else if temp == 'Hispanic'
                whiteOutcome(i) = 0;
            else if temp == 'Asian'
                    whiteOutcome(i)=0;
                else if temp == 'Other'
                        whiteOutcome(i) = 0;
                    else
                        miscCategory(i) = 1;
                    end
                end
            end
        end
    end
end

%%Creating Black variable - 1 if black, else 0
blackOutcome = zeros(length(data.driver_race),1);
for i=1:length(blackOutcome)
    temp = data.driver_race(i);
    if temp == 'White'
        blackOutcome(i) = 0;
    else if temp == 'Black'
            blackOutcome(i) = 1;
        else if temp == 'Hispanic'
                blackOutcome(i) = 0;
            else if temp == 'Asian'
                    blackOutcome(i)=0;
                else if temp == 'Other'
                        blackOutcome(i) = 0;
                    else
                        miscCategory(i) = 1;
                    end
                end
            end
        end
    end
end

%%Creating Hispanic variable - 1 if hispanic, else 0
hispanicOutcome = zeros(length(data.driver_race),1);
for i=1:length(hispanicOutcome)
    temp = data.driver_race(i);
    if temp == 'White'
        hispanicOutcome(i) = 0;
    else if temp == 'Black'
            hispanicOutcome(i) = 0;
        else if temp == 'Hispanic'
                hispanicOutcome(i) = 1;
            else if temp == 'Asian'
                    hispanicOutcome(i)=0;
                else if temp == 'Other'
                        hispanicOutcome(i) = 0;
                    else
                        miscCategory(i) = 1;
                    end
                end
            end
        end
    end
end

%%Creating Asian variable - 1 if asian, else 0
asianOutcome = zeros(length(data.driver_race),1);
for i=1:length(asianOutcome)
    temp = data.driver_race(i);
    if temp == 'White'
        asianOutcome(i) = 0;
    else if temp == 'Black'
            asianOutcome(i) = 0;
        else if temp == 'Hispanic'
                asianOutcome(i) = 0;
            else if temp == 'Asian'
                    asianOutcome(i)=1;
                else if temp == 'Other'
                        asianOutcome(i) = 0;
                    else
                        miscCategory(i) = 1;
                    end
                end
            end
        end
    end
end

%%Creating raceOther variable - 1 if other, else 0
raceOtherOutcome = zeros(length(data.driver_race),1);
for i=1:length(raceOtherOutcome)
    temp = data.driver_race(i);
    if temp == 'White'
        raceOtherOutcome(i) = 0;
    else if temp == 'Black'
            raceOtherOutcome(i) = 0;
        else if temp == 'Hispanic'
                raceOtherOutcome(i) = 0;
            else if temp == 'Asian'
                    raceOtherOutcome(i)=0;
                else if temp == 'Other'
                        raceOtherOutcome(i) = 1;
                    else
                        miscCategory(i) = 1;
                    end
                end
            end
        end
    end
end

%{
%%bin 'violation' into numerical vars
%% Speeding = 1, Moving violation = 2, Lights = 3, Registration/plates = 4, Safe Movement =5,Cell Phone =6, Seatbelt = 7,Stop sign/light = 8
%% Other = 9
violationOutcome = zeros(length(data.violation),1);
for i=1:length(raceOutcome)
    temp = data.violation(i);
    if temp == 'Speeding'
        violationOutcome(i) = 1;
    else if temp == 'Moving violation'
            violationOutcome(i) = 2;
        else if temp == 'Lights'
                violationOutcome(i) = 3;
            else if temp == 'Registration/plates'
                    violationOutcome(i)=4;
                else if temp == 'Safe Movement'
                        violationOutcome(i) = 5;
                    else if temp == 'Cell Phone'
                            violationOutcome(i) = 6;
                        else if temp == 'Seatbelt'
                                violationOutcome(i) = 7;
                            else if temp == 'Stop sign/light'
                                    violationOutcome(i) = 8;
                                else
                                    violationOutcome(i) = 9;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
%}

%%Creating speeding variable - 1 if speeding, else 0
speedingOutcome = zeros(length(data.violation),1);
for i=1:length(speedingOutcome)
    temp = data.violation(i);
    if strfind(char(temp),'Speeding')
        speedingOutcome(i) = 1;
    else
        speedingOutcome(i) = 0;
    end
end


%%Creating movingViolation variable - 1 if movingViolation, else 0
%% ~strfind(char(temp),'Moving violation')==[]
movingViolationOutcome = zeros(length(data.violation),1);
for i=1:length(speedingOutcome)
    temp = data.violation(i);
    if strfind(char(temp),'Moving violation')
        movingViolationOutcome(i) = 1;
    else
        movingViolationOutcome(i) = 0;
    end
end


%%Creating lights variable - 1 if lights, else 0
lightsOutcome = zeros(length(data.violation),1);
for i=1:length(lightsOutcome)
    temp = data.violation(i);
    if strfind(char(temp),'Lights')
        lightsOutcome(i) = 1;
    else
        lightsOutcome(i) = 0;
    end
end


%%Creating registrationPlates variable - 1 if registrationPlates, else 0
registrationPlatesOutcome = zeros(length(data.violation),1);
for i=1:length(registrationPlatesOutcome)
    temp = data.violation(i);
    if strfind(char(temp),'Registration/plates')
        registrationPlatesOutcome(i) = 1;
    else
        registrationPlatesOutcome(i) = 0;
    end
end


%%Creating safeMovement variable - 1 if safeMovement, else 0
safeMovementOutcome = zeros(length(data.violation),1);
for i=1:length(safeMovementOutcome)
    temp = data.violation(i);
    if strfind(char(temp),'Safe movement')
        safeMovementOutcome(i) = 1;
    else
        safeMovementOutcome(i) = 0;
    end
end


%%Creating cellPhone variable - 1 if cellPhone, else 0
cellPhoneOutcome = zeros(length(data.violation),1);
for i=1:length(cellPhoneOutcome)
    temp = data.violation(i);
    if strfind(char(temp),'Cell phone')
        cellPhoneOutcome(i) = 1;
    else
        cellPhoneOutcome(i) = 0;
    end
end


%%Creating seatBelt variable - 1 if seatBelt, else 0
seatBeltOutcome = zeros(length(data.violation),1);
for i=1:length(seatBeltOutcome)
    temp = data.violation(i);
    if strfind(char(temp),'Seat belt')
        seatBeltOutcome(i) = 1;
    else
        seatBeltOutcome(i) = 0;
    end
end


%%Creating stopSignLight variable - 1 if stopSignLight, else 0
stopSignLightOutcome = zeros(length(data.violation),1);
for i=1:length(stopSignLightOutcome)
    temp = data.violation(i);
    if strfind(char(temp),'Stop sign/light')
        stopSignLightOutcome(i) = 1;
    else
        stopSignLightOutcome(i) = 0;
    end
end


%%Creating violationOther variable - 1 if violationOther, else 0
violationOtherOutcome = zeros(length(data.violation),1);
for i=1:length(violationOtherOutcome)
    temp = data.violation(i);
    if strfind(char(temp),'Speeding')
        violationOtherOutcome(i) = 0;
    else if strfind(char(temp),'Moving violation')
            violationOtherOutcome(i) = 0;
        else if strfind(char(temp),'Lights')
                violationOtherOutcome(i) = 0;
            else if strfind(char(temp),'Registration/plates')
                    violationOtherOutcome(i)=0;
                else if strfind(char(temp),'Safe Movement')
                        violationOtherOutcome(i) = 0;
                    else if strfind(char(temp),'Cell Phone')
                            violationOtherOutcome(i) = 0;
                        else if strfind(char(temp),'Seatbelt')
                                violationOtherOutcome(i) = 0;
                            else if strfind(char(temp),'Stop sign/light')
                                    violationOtherOutcome(i) = 0;
                                else
                                    violationOtherOutcome(i) = 1;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

%{
%%%%%%%%%%%%%%%%%%%%Age
%%%16-25: 1 26-35: 2 36-45: 3 etc
ageOutcome = zeros(length(data.driver_age),1);
for i=1:length(ageOutcome)
    temp = data.driver_age(i);
    if temp < 25 && temp >= 16
        ageOutcome(i) = 1;
    else if temp < 35 && temp >= 26
            ageOutcome(i) = 2;
        else if temp < 45 && temp >= 36
                ageOutcome(i) = 3;
            else if temp  < 55 && temp >= 46
                    ageOutcome(i)=4;
                else if temp  < 65 && temp >= 56
                        ageOutcome(i) = 5;
                    else if temp  < 75 && temp >= 66
                            ageOutcome(i) = 6;
                        else if temp  < 85 && temp >= 76
                                ageOutcome(i) = 7;
                            else if temp > 86
                                    ageOutcome(i) = 8;
                                else
                                    miscCategory(i)=1;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
%}

%%Creating age1625 variable - 1 if  age1625, else 0
age1625Outcome = zeros(length(data.driver_age),1);
for i=1:length(age1625Outcome)
    temp = data.driver_age(i);
    if temp < 25 && temp >= 16
        age1625Outcome(i) = 1;
    else if temp < 35 && temp >= 26
            age1625Outcome(i) = 0;
        else if temp < 45 && temp >= 36
                age1625Outcome(i) = 0;
            else if temp  < 55 && temp >= 46
                    age1625Outcome(i)=0;
                else if temp  < 65 && temp >= 56
                        age1625Outcome(i) = 0;
                    else if temp  < 75 && temp >= 66
                            age1625Outcome(i) = 0;
                        else if temp  < 85 && temp >= 76
                                age1625Outcome(i) = 0;
                            else if temp > 86
                                    age1625Outcome(i) = 0;
                                else
                                    miscCategory(i)=1;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

%%Creating age2635 variable - 1 if  age2635, else 0
age2635Outcome = zeros(length(data.driver_age),1);
for i=1:length(age2635Outcome)
    temp = data.driver_age(i);
    if temp < 25 && temp >= 16
        age2635Outcome(i) = 0;
    else if temp < 35 && temp >= 26
            age2635Outcome(i) = 1;
        else if temp < 45 && temp >= 36
                age2635Outcome(i) = 0;
            else if temp  < 55 && temp >= 46
                    age2635Outcome(i)=0;
                else if temp  < 65 && temp >= 56
                        age2635Outcome(i) = 0;
                    else if temp  < 75 && temp >= 66
                            age2635Outcome(i) = 0;
                        else if temp  < 85 && temp >= 76
                                age2635Outcome(i) = 0;
                            else if temp > 86
                                    age2635Outcome(i) = 0;
                                else
                                    miscCategory(i)=1;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

%%Creating age3645 variable - 1 if  age3645, else 0
age3645Outcome = zeros(length(data.driver_age),1);
for i=1:length(age3645Outcome)
    temp = data.driver_age(i);
    if temp < 25 && temp >= 16
        age3645Outcome(i) = 0;
    else if temp < 35 && temp >= 26
            age3645Outcome(i) = 0;
        else if temp < 45 && temp >= 36
                age3645Outcome(i) = 1;
            else if temp  < 55 && temp >= 46
                    age3645Outcome(i)=0;
                else if temp  < 65 && temp >= 56
                        age3645Outcome(i) = 0;
                    else if temp  < 75 && temp >= 66
                            age3645Outcome(i) = 0;
                        else if temp  < 85 && temp >= 76
                                age3645Outcome(i) = 0;
                            else if temp > 86
                                    age3645Outcome(i) = 0;
                                else
                                    miscCategory(i)=1;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

%%Creating age4655 variable - 1 if  age4655, else 0
age4655Outcome = zeros(length(data.driver_age),1);
for i=1:length(age4655Outcome)
    temp = data.driver_age(i);
    if temp < 25 && temp >= 16
        age4655Outcome(i) = 0;
    else if temp < 35 && temp >= 26
            age4655Outcome(i) = 0;
        else if temp < 45 && temp >= 36
                age4655Outcome(i) = 0;
            else if temp  < 55 && temp >= 46
                    age4655Outcome(i)=1;
                else if temp  < 65 && temp >= 56
                        age4655Outcome(i) = 0;
                    else if temp  < 75 && temp >= 66
                            age4655Outcome(i) = 0;
                        else if temp  < 85 && temp >= 76
                                age4655Outcome(i) = 0;
                            else if temp > 86
                                    age4655Outcome(i) = 0;
                                else
                                    miscCategory(i)=1;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

%%Creating age5665 variable - 1 if  age5665, else 0
age5665Outcome = zeros(length(data.driver_age),1);
for i=1:length(age5665Outcome)
    temp = data.driver_age(i);
    if temp < 25 && temp >= 16
        age5665Outcome(i) = 0;
    else if temp < 35 && temp >= 26
            age5665Outcome(i) = 0;
        else if temp < 45 && temp >= 36
                age5665Outcome(i) = 0;
            else if temp  < 55 && temp >= 46
                    age5665Outcome(i)=0;
                else if temp  < 65 && temp >= 56
                        age5665Outcome(i) = 1;
                    else if temp  < 75 && temp >= 66
                            age5665Outcome(i) = 0;
                        else if temp  < 85 && temp >= 76
                                age5665Outcome(i) = 0;
                            else if temp > 86
                                    age5665Outcome(i) = 0;
                                else
                                    miscCategory(i)=1;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

%%Creating age6675 variable - 1 if  age6675, else 0
age6675Outcome = zeros(length(data.driver_age),1);
for i=1:length(age6675Outcome)
    temp = data.driver_age(i);
    if temp < 25 && temp >= 16
        age6675Outcome(i) = 0;
    else if temp < 35 && temp >= 26
            age6675Outcome(i) = 0;
        else if temp < 45 && temp >= 36
                age6675Outcome(i) = 0;
            else if temp  < 55 && temp >= 46
                    age6675Outcome(i)=0;
                else if temp  < 65 && temp >= 56
                        age6675Outcome(i) = 0;
                    else if temp  < 75 && temp >= 66
                            age6675Outcome(i) = 1;
                        else if temp  < 85 && temp >= 76
                                age6675Outcome(i) = 0;
                            else if temp > 86
                                    age6675Outcome(i) = 0;
                                else
                                    miscCategory(i)=1;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

%%Creating age7685 variable - 1 if  age7685, else 0
age7685Outcome = zeros(length(data.driver_age),1);
for i=1:length(age7685Outcome)
    temp = data.driver_age(i);
    if temp < 25 && temp >= 16
        age7685Outcome(i) = 0;
    else if temp < 35 && temp >= 26
            age7685Outcome(i) = 0;
        else if temp < 45 && temp >= 36
                age7685Outcome(i) = 0;
            else if temp  < 55 && temp >= 46
                    age7685Outcome(i)=0;
                else if temp  < 65 && temp >= 56
                        age7685Outcome(i) = 0;
                    else if temp  < 75 && temp >= 66
                            age7685Outcome(i) = 0;
                        else if temp  < 85 && temp >= 76
                                age7685Outcome(i) = 1;
                            else if temp > 86
                                    age7685Outcome(i) = 0;
                                else
                                    miscCategory(i)=1;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

%%Creating ageAbove86 variable - 1 if  ageAbove86, else 0
ageAbove86Outcome = zeros(length(data.driver_age),1);
for i=1:length(ageAbove86Outcome)
    temp = data.driver_age(i);
    if temp < 25 && temp >= 16
        ageAbove86Outcome(i) = 0;
    else if temp < 35 && temp >= 26
            ageAbove86Outcome(i) = 0;
        else if temp < 45 && temp >= 36
                ageAbove86Outcome(i) = 0;
            else if temp  < 55 && temp >= 46
                    ageAbove86Outcome(i)=0;
                else if temp  < 65 && temp >= 56
                        ageAbove86Outcome(i) = 0;
                    else if temp  < 75 && temp >= 66
                            ageAbove86Outcome(i) = 0;
                        else if temp  < 85 && temp >= 76
                                ageAbove86Outcome(i) = 0;
                            else if temp > 86
                                    ageAbove86Outcome(i) = 1;
                                else
                                    miscCategory(i)=1;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end







%% find missing county-fips and add them to the missing category list
fipsOutcome = zeros(length(data.county_fips),1);
for j=1:length(fipsOutcome)
    temp = data.county_fips(j);
    if isnan(temp)
        miscCategory(j) = 1;
    else
        fipsOutcome(j) = data.county_fips(j);
    end
end

%{
%%bin 'duration' into numerical vars
%% 1-15 = 1, 16-30 = 2, 30+ = 3
durationOutcome = zeros(length(data.stop_duration),1);
for i=1:length(durationOutcome)
    temp = data.stop_duration(i);
    if temp == '1-15 min'
        durationOutcome(i) = 1;
    else if temp == '16-30 min'
            durationOutcome(i) = 2;
        else if temp == '30+ min'
            durationOutcome(i) = 3;
            else
                miscCategory(i) = 1;
            end
        end
    end
end
%}

%%Creating stopDuration115 variable - 1 if stopDuration115, else 0
stopDuration115Outcome = zeros(length(data.stop_duration),1);
for i=1:length(stopDuration115Outcome)
    temp = data.stop_duration(i);
    if temp == '1-15 min'
        stopDuration115Outcome(i) = 1;
    else if temp == '16-30 min'
            stopDuration115Outcome(i) = 0;
        else if temp == '30+ min'
                stopDuration115Outcome(i) = 0;
            else
                miscCategory(i) = 1;
            end
        end
    end
end

%%Creating stopDuration1630 variable - 1 if stopDuration1630, else 0
stopDuration1630Outcome = zeros(length(data.stop_duration),1);
for i=1:length(stopDuration1630Outcome)
    temp = data.stop_duration(i);
    if temp == '1-15 min'
        stopDuration1630Outcome(i) = 0;
    else if temp == '16-30 min'
            stopDuration1630Outcome(i) = 1;
        else if temp == '30+ min'
                stopDuration1630Outcome(i) = 0;
            else
                miscCategory(i) = 1;
            end
        end
    end
end

%%Creating stopDuration30plus variable - 1 if stopDuration30plus, else 0
stopDuration30plusOutcome = zeros(length(data.stop_duration),1);
for i=1:length(stopDuration30plusOutcome)
    temp = data.stop_duration(i);
    if temp == '1-15 min'
        stopDuration30plusOutcome(i) = 0;
    else if temp == '16-30 min'
            stopDuration30plusOutcome(i) = 0;
        else if temp == '30+ min'
                stopDuration30plusOutcome(i) = 1;
            else
                miscCategory(i) = 1;
            end
        end
    end
end


%%%%% These need to come at end of this file. They eliminate all rows in
%%%%% which one of the features is missing
missingIndicesFeatures = find(miscCategory);
data(missingIndicesFeatures,:) = [];
stopOutcome(missingIndicesFeatures,:) = [];
%genderOutcome(missingIndicesFeatures,:) = [];
%raceOutcome(missingIndicesFeatures,:) = [];
%violationOutcome(missingIndicesFeatures,:) = [];
fipsOutcome(missingIndicesFeatures,:) = [];
%ageOutcome(missingIndicesFeatures,:) = [];
%durationOutcome(missingIndicesFeatures,:) = [];
femaleOutcome(missingIndicesFeatures,:) = [];
maleOutcome(missingIndicesFeatures,:) = [];
whiteOutcome(missingIndicesFeatures,:) = [];
blackOutcome(missingIndicesFeatures,:) = [];
hispanicOutcome(missingIndicesFeatures,:) = [];
asianOutcome(missingIndicesFeatures,:) = [];
raceOtherOutcome(missingIndicesFeatures,:) = [];
speedingOutcome(missingIndicesFeatures,:) = [];
movingViolationOutcome(missingIndicesFeatures,:) = [];
lightsOutcome(missingIndicesFeatures,:) = [];
registrationPlatesOutcome(missingIndicesFeatures,:) = [];
safeMovementOutcome(missingIndicesFeatures,:) = [];
cellPhoneOutcome(missingIndicesFeatures,:) = [];
seatBeltOutcome(missingIndicesFeatures,:) = [];
violationOtherOutcome(missingIndicesFeatures,:) = [];
age1625Outcome(missingIndicesFeatures,:) = [];
age2635Outcome(missingIndicesFeatures,:) = [];
age3645Outcome(missingIndicesFeatures,:) = [];
age4655Outcome(missingIndicesFeatures,:) = [];
age5665Outcome(missingIndicesFeatures,:) = [];
age6675Outcome(missingIndicesFeatures,:) = [];
age7685Outcome(missingIndicesFeatures,:) = [];
ageAbove86Outcome(missingIndicesFeatures,:) = [];
stopDuration115Outcome(missingIndicesFeatures,:) = [];
stopDuration1630Outcome(missingIndicesFeatures,:) = [];
stopDuration30plusOutcome(missingIndicesFeatures,:) = [];
