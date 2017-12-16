numtrain = 100000;
%stopOutcomeTRAIN = stopOutcome(1:numtrain);
downstopOutcomeTRAIN = stopOutcome;
totaltrainclass1 = length(find(downstopOutcomeTRAIN));
totaltrainclass0 = length(downstopOutcomeTRAIN) - totaltrainclass1;

removed = [];
test = 0;
while length(removed) < floor(totaltrainclass1-totaltrainclass0)
    test = randi([1 length(downstopOutcomeTRAIN)],1,1);
    if downstopOutcomeTRAIN(test(1)) == 1 && ~ismember(test(1),removed)
        removed = [removed, test];
    end
end
newvec = sort(removed, 'ascend');


