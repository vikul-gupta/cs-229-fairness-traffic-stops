function error_result_vector = ComputeTestAccuracyEdited(numtest, test_data, std_test_data, thetas_vec, true_output_test, threshold_vector)
% Required parameters: numtest = number of test samples, data = n*p matrix of test data,
%regression_output_test is n*1 vector of regression outputs for test data, threshold_vector has
%length of 14 with in order: (generalThreshold, whiteThreshold, blackThreshold, hispanicThreshold, maleThreshold, femaleThreshold, 1625Threshold, 2635Threshold, and so on...))


regression_output_test = computeprobabilities(thetas_vec,std_test_data);

white_index = 5;
black_index = 6;
hispanic_index = 7;
male_index = 4;
female_index = 3;
index_1625 = 18;
index_2635 = 19;
index_3645 = 20;
index_4655 = 21;
index_5665 = 22;
index_6675 = 23;
index_7685 = 24;
index_86plus = 25;

misclassificationstest = 0;
count2test = 0;

testTP = 0;
testFP = 0;
testFN = 0;
testTN = 0;

testWhiteFP = 0;
testWhiteFN = 0;
testWhiteTN = 0;
testWhiteTP = 0;
testnumW = 0;


testBlackFP = 0;
testBlackFN =0;
testBlackTP = 0;
testBlackTN = 0;
testnumB = 0;

testHispanicFN = 0;
testHispanicFP = 0;
testHispanicTP = 0;
testHispanicTN = 0;
testnumH = 0;

testMaleFP = 0;
testMaleFN =0;
testMaleTP = 0;
testMaleTN = 0;
testnumM = 0;

testFemaleFP = 0;
testFemaleFN =0;
testFemaleTP = 0;
testFemaleTN = 0;
testnumF = 0;

test1625FP = 0;
test1625FN =0;
test1625TP = 0;
test1625TN = 0;
testnum1625 = 0;

test2635FP = 0;
test2635FN =0;
test2635TP = 0;
test2635TN = 0;
testnum2635 = 0;

test3645FP = 0;
test3645FN =0;
test3645TP = 0;
test3645TN = 0;
testnum3645 = 0;

test4655FP = 0;
test4655FN =0;
test4655TP = 0;
test4655TN = 0;
testnum4655 = 0;

test5665FP = 0;
test5665FN =0;
test5665TP = 0;
test5665TN = 0;
testnum5665 = 0;

test6675FP = 0;
test6675FN =0;
test6675TP = 0;
test6675TN = 0;
testnum6675 = 0;

test7685FP = 0;
test7685FN =0;
test7685TP = 0;
test7685TN = 0;
testnum7685 = 0;

test86plusFP = 0;
test86plusFN =0;
test86plusTP = 0;
test86plusTN = 0;
testnum86plus = 0;



generalThreshold = threshold_vector(1);
whiteThreshold = threshold_vector(2);
blackThreshold = threshold_vector(3);
hispanicThreshold = threshold_vector(4);
maleThreshold = threshold_vector(5);
femaleThreshold = threshold_vector(6);
Threshold1625 = threshold_vector(7);
Threshold2635 = threshold_vector(8);
Threshold3645 = threshold_vector(9);
Threshold4655 = threshold_vector(10);
Threshold5665 = threshold_vector(11);
Threshold6675 = threshold_vector(12);
Threshold7685 = threshold_vector(13);
Threshold86plus = threshold_vector(14);


for num=1:numtest
    %%%GENERAL
    
    temp=0;
    if regression_output_test(num) > (generalThreshold-10^(-15))
        temp = 1;
    else
        count2test = count2test+1;
        temp = 0;
    end
    if temp ~= true_output_test(num)
        if temp == 1
            testFP = testFP +1;
            
        else
            testFN = testFN + 1;
        end
        
    else
        if temp == 1
            testTP = testTP +1;
            
        else
            testTN = testTN + 1;
        end
    end
    %%%WHITE
    if test_data(num,white_index)==1
        testnumW = testnumW + 1;
        temp=0;
        if regression_output_test(num) > (whiteThreshold-10^(-15))
            temp = 1;
        else
            temp = 0;
        end
        if temp ~= true_output_test(num)
            if temp == 1
                testWhiteFP = testWhiteFP +1;
                
            else
                testWhiteFN = testWhiteFN + 1;
            end
            
        else
            if temp == 1
                testWhiteTP = testWhiteTP +1;
                
            else
                testWhiteTN = testWhiteTN + 1;
            end
        end
        
    end
    %%%BLACK
    if test_data(num,black_index)==1
        testnumB = testnumB + 1;
        temp=0;
        if regression_output_test(num) > (blackThreshold-10^(-15))
            temp = 1;
        else
            temp = 0;
        end
        if temp ~= true_output_test(num)
            if temp == 1
                testBlackFP = testBlackFP +1;
                
            else
                testBlackFN = testBlackFN + 1;
            end
            
        else
            if temp == 1
                testBlackTP = testBlackTP +1;
                
            else
                testBlackTN = testBlackTN + 1;
            end
        end
    end
    %%%HISPANIC
    if test_data(num,hispanic_index)==1
        testnumH = testnumH + 1;
        temp=0;
        if regression_output_test(num) > (hispanicThreshold-10^(-15))
            temp = 1;
        else
            temp = 0;
        end
        if temp ~= true_output_test(num)
            if temp == 1
                testHispanicFP = testHispanicFP +1;
                
            else
                testHispanicFN = testHispanicFN + 1;
            end
            
        else
            if temp == 1
                testHispanicTP = testHispanicTP +1;
                
            else
                testHispanicTN = testHispanicTN + 1;
            end
        end
    end
    %%%MALE
    if test_data(num,male_index)==1
        testnumM = testnumM + 1;
        temp=0;
        if regression_output_test(num) > (maleThreshold-10^(-15))
            temp = 1;
        else
            temp = 0;
        end
        if temp ~= true_output_test(num)
            if temp == 1
                testMaleFP = testMaleFP +1;
                
            else
                testMaleFN = testMaleFN + 1;
            end
            
        else
            if temp == 1
                testMaleTP = testMaleTP +1;
                
            else
                testMaleTN = testMaleTN + 1;
            end
        end
    end
    %%%FEMALE
    if test_data(num,female_index)==1
        testnumF = testnumF + 1;
        temp=0;
        if regression_output_test(num) > (femaleThreshold-10^(-15))
            temp = 1;
        else
            temp = 0;
        end
        if temp ~= true_output_test(num)
            if temp == 1
                testFemaleFP = testFemaleFP +1;
                
            else
                testFemaleFN = testFemaleFN + 1;
            end
            
        else
            if temp == 1
                testFemaleTP = testFemaleTP +1;
                
            else
                testFemaleTN = testFemaleTN + 1;
            end
        end
    end
    
    
    %%%1625
    if test_data(num,index_1625)==1
        testnum1625 = testnum1625 + 1;
        temp=0;
        if regression_output_test(num) > (Threshold1625-10^(-15))
            temp = 1;
        else
            temp = 0;
        end
        if temp ~= true_output_test(num)
            if temp == 1
                test1625FP = test1625FP +1;
                
            else
                test1625FN = test1625FN + 1;
            end
            
        else
            if temp == 1
                test1625TP = test1625TP +1;
                
            else
                test1625TN = test1625TN + 1;
            end
        end
    end
    
    
    %%%2635
    if test_data(num,index_2635)==1
        testnum2635 = testnum2635 + 1;
        temp=0;
        if regression_output_test(num) > (Threshold2635-10^(-15))
            temp = 1;
        else
            temp = 0;
        end
        if temp ~= true_output_test(num)
            if temp == 1
                test2635FP = test2635FP +1;
                
            else
                test2635FN = test2635FN + 1;
            end
            
        else
            if temp == 1
                test2635TP = test2635TP +1;
                
            else
                test2635TN = test2635TN + 1;
            end
        end
    end
    
    
    
    %%%3645
    if test_data(num,index_3645)==1
        testnum3645 = testnum3645 + 1;
        temp=0;
        if regression_output_test(num) > (Threshold3645-10^(-15))
            temp = 1;
        else
            temp = 0;
        end
        if temp ~= true_output_test(num)
            if temp == 1
                test3645FP = test3645FP +1;
                
            else
                test3645FN = test3645FN + 1;
            end
            
        else
            if temp == 1
                test3645TP = test3645TP +1;
                
            else
                test3645TN = test3645TN + 1;
            end
        end
    end
    
    
    %%%4655
    if test_data(num,index_4655)==1
        testnum4655 = testnum4655 + 1;
        temp=0;
        if regression_output_test(num) > (Threshold4655-10^(-15))
            temp = 1;
        else
            temp = 0;
        end
        if temp ~= true_output_test(num)
            if temp == 1
                test4655FP = test4655FP +1;
                
            else
                test4655FN = test4655FN + 1;
            end
            
        else
            if temp == 1
                test4655TP = test4655TP +1;
                
            else
                test4655TN = test4655TN + 1;
            end
        end
    end
    
    
    %%%5665
    if test_data(num,index_5665)==1
        testnum5665 = testnum5665 + 1;
        temp=0;
        if regression_output_test(num) > (Threshold5665-10^(-15))
            temp = 1;
        else
            temp = 0;
        end
        if temp ~= true_output_test(num)
            if temp == 1
                test5665FP = test5665FP +1;
                
            else
                test5665FN = test5665FN + 1;
            end
            
        else
            if temp == 1
                test5665TP = test5665TP +1;
                
            else
                test5665TN = test5665TN + 1;
            end
        end
    end
    
    
    %%%6675
    if test_data(num,index_6675)==1
        testnum6675 = testnum6675 + 1;
        temp=0;
        if regression_output_test(num) > (Threshold6675-10^(-15))
            temp = 1;
        else
            temp = 0;
        end
        if temp ~= true_output_test(num)
            if temp == 1
                test6675FP = test6675FP +1;
                
            else
                test6675FN = test6675FN + 1;
            end
            
        else
            if temp == 1
                test6675TP = test6675TP +1;
                
            else
                test6675TN = test6675TN + 1;
            end
        end
    end
    
    
    %%%7685
    if test_data(num,index_7685)==1
        testnum7685 = testnum7685 + 1;
        temp=0;
        if regression_output_test(num) > (Threshold7685-10^(-15))
            temp = 1;
        else
            temp = 0;
        end
        if temp ~= true_output_test(num)
            if temp == 1
                test7685FP = test7685FP +1;
                
            else
                test7685FN = test7685FN + 1;
            end
            
        else
            if temp == 1
                test7685TP = test7685TP +1;
                
            else
                test7685TN = test7685TN + 1;
            end
        end
    end
    
    
    %%%86plus
    if test_data(num,index_86plus)==1
        testnum86plus = testnum86plus + 1;
        temp=0;
        if regression_output_test(num) > (Threshold86plus-10^(-15))
            temp = 1;
        else
            temp = 0;
        end
        if temp ~= true_output_test(num)
            if temp == 1
                test86plusFP = test86plusFP +1;
                
            else
                test86plusFN = test86plusFN + 1;
            end
            
        else
            if temp == 1
                test86plusTP = test86plusTP +1;
                
            else
                test86plusTN = test86plusTN + 1;
            end
        end
    end
end    
    
    
    testacc = misclassificationstest/numtest;
    
    nonWarnPercGENERAL = (testFP + testTP)/ numtest;
    nonWarnPercWhite =  (testWhiteFP + testWhiteTP)/ testnumW;
    nonWarnPercBlack = (testBlackFP + testBlackTP)/ testnumB;
    nonWarnPercHispanic = (testHispanicFP + testHispanicTP)/ testnumH;
    nonWarnPercMale = (testMaleFP + testMaleTP)/ testnumM;
    nonWarnPercFemale = (testFemaleFP + testFemaleTP)/ testnumF;
    nonWarnPerc1625 =(test1625FP + test1625TP)/ testnum1625;
    nonWarnPerc2635 =(test2635FP + test2635TP)/ testnum2635;
    nonWarnPerc3645 =(test3645FP + test3645TP)/ testnum3645;
    nonWarnPerc4655 =(test4655FP + test4655TP)/ testnum4655;
    nonWarnPerc5665 =(test5665FP + test5665TP)/ testnum5665;
    nonWarnPerc6675 =(test6675FP + test6675TP)/ testnum6675;
    nonWarnPerc7685 =(test7685FP + test7685TP)/ testnum7685;
    nonWarnPerc86plus =(test86plusFP + test86plusTP)/ testnum86plus;
    
    falsePositiveRateGENERAL = testFP/(testFP + testTN);
    falsePositiveRateWhite = testWhiteFP/(testWhiteFP + testWhiteTN);
    falsePositiveRateBlack = testBlackFP/(testBlackFP + testBlackTN);
    falsePositiveRateHispanic =  testHispanicFP/(testHispanicFP + testHispanicTN);
    falsePositiveRateMale = testMaleFP/(testMaleFP + testMaleTN);
    falsePositiveRateFemale = testFemaleFP/(testFemaleFP + testFemaleTN);
    falsePositiveRate1625 = test1625FP/(test1625FP + test1625TN);
    falsePositiveRate2635 =test2635FP/(test2635FP + test2635TN);
    falsePositiveRate3645 =test3645FP/(test3645FP + test3645TN);
    falsePositiveRate4655 =test4655FP/(test4655FP + test4655TN);
    falsePositiveRate5665 =test5665FP/(test5665FP + test5665TN);
    falsePositiveRate6675 =test6675FP/(test6675FP + test6675TN);
    falsePositiveRate7685 =test7685FP/(test7685FP + test7685TN);
    falsePositiveRate86plus =test86plusFP/(test86plusFP + test86plusTN);
    
    balancedErrorGENERAL = 0.5*((testFP/(testFP+testTN))+(testFN/(testFN+testTP)));
    balancedErrorWhite = 0.5*((testWhiteFP/(testWhiteFP+testWhiteTN))+(testWhiteFN/(testWhiteFN+testWhiteTP)));
    balancedErrorBlack = 0.5*((testBlackFP/(testBlackFP+testBlackTN))+(testBlackFN/(testBlackFN+testBlackTP)));
    balancedErrorHispanic = 0.5*((testHispanicFP/(testHispanicFP+testHispanicTN))+(testHispanicFN/(testHispanicFN+testHispanicTP)));
    balancedErrorMale = 0.5*((testMaleFP/(testMaleFP+testMaleTN))+(testMaleFN/(testMaleFN+testMaleTP)));
    balancedErrorFemale = 0.5*((testFemaleFP/(testFemaleFP+testFemaleTN))+(testFemaleFN/(testFemaleFN+testFemaleTP)));
    balancedError1625 = 0.5*((test1625FP/(test1625FP+test1625TN))+(test1625FN/(test1625FN+test1625TP)));
    balancedError2635 = 0.5*((test2635FP/(test2635FP+test2635TN))+(test2635FN/(test2635FN+test2635TP)));
    balancedError3645 = 0.5*((test3645FP/(test3645FP+test3645TN))+(test3645FN/(test3645FN+test3645TP)));
    balancedError4655 = 0.5*((test4655FP/(test4655FP+test4655TN))+(test4655FN/(test4655FN+test4655TP)));
    balancedError5665 = 0.5*((test5665FP/(test5665FP+test5665TN))+(test5665FN/(test5665FN+test5665TP)));
    balancedError6675 = 0.5*((test6675FP/(test6675FP+test6675TN))+(test6675FN/(test6675FN+test6675TP)));
    balancedError7685 = 0.5*((test7685FP/(test7685FP+test7685TN))+(test7685FN/(test7685FN+test7685TP)));
    balancedError86plus = 0.5*((test86plusFP/(test86plusFP+test86plusTN))+(test86plusFN/(test86plusFN+test86plusTP)));
    
    %{
precisionGeneral= testTP/(testTP+testFP);
precisionWhite= testWhiteTP/(testWhiteTP+testWhiteFP);
precisionBlack= testBlackTP/(testBlackTP+testBlackFP);
precisionHispanic= testHispanicTP/(testHispanicTP+testHispanicFP);
precisionMale= testMaleTP/(testMaleTP+testMaleFP);
precisionFemale= testFemaleTP/(testFemaleTP+testFemaleFP);
precision1625 =0;
precision2635 =0;
precision3645 =0;
precision4655 =0;
precision5665 =0;
precision6675 =0;
precision7685 =0;
precision86plus =0;

recallGeneral= testTP/(testTP+testFN);
recallWhite= testWhiteTP/(testWhiteTP+testWhiteFN);
recallBlack= testBlackTP/(testBlackTP+testBlackFN);
recallHispanic= testHispanicTP/(testHispanicTP+testHispanicFN);
recallMale= testMaleTP/(testMaleTP+testMaleFN);
recallFemale= testFemaleTP/(testFemaleTP+testFemaleFN);
recall1625 =0;
recall2635 =0;
recall3645 =0;
recall4655 =0;
recall5665 =0;
recall6675 =0;
recall7685 =0;
recall86plus =0;

F1General = 2/((1/recallGeneral)+(1/precisionGeneral));
F1White = 2/((1/recallWhite)+(1/precisionWhite));
F1Black= 2/((1/recallBlack)+(1/precisionBlack));
F1Hispanic= 2/((1/recallHispanic)+(1/precisionHispanic));
F1Male= 2/((1/recallMale)+(1/precisionMale));
F1Female= 2/((1/recallFemale)+(1/precisionFemale));
F11625 =0;
F12635 =0;
F13645 =0;
F14655 =0;
F15665 =0;
F16675 =0;
F17685 =0;
F186plus =0;
    %}
    
    error_result_vector = [misclassificationstest, count2test, testacc, nonWarnPercGENERAL, nonWarnPercWhite, nonWarnPercBlack, ...
        nonWarnPercHispanic, nonWarnPercMale, nonWarnPercFemale, nonWarnPerc1625, nonWarnPerc2635, nonWarnPerc3645, nonWarnPerc4655, ...
        nonWarnPerc5665, nonWarnPerc6675, nonWarnPerc7685, nonWarnPerc86plus, falsePositiveRateGENERAL, falsePositiveRateWhite, falsePositiveRateBlack, ...
        falsePositiveRateHispanic, falsePositiveRateMale, falsePositiveRateFemale, falsePositiveRate1625, falsePositiveRate2635, falsePositiveRate3645, ...
        falsePositiveRate4655, falsePositiveRate5665, falsePositiveRate6675, falsePositiveRate7685,falsePositiveRate86plus balancedErrorGENERAL, balancedErrorWhite, ...
        balancedErrorBlack,balancedErrorHispanic, balancedErrorMale, balancedErrorFemale, balancedError1625, balancedError2635, balancedError3645,balancedError4655, ...
        balancedError5665, balancedError6675, balancedError7685, balancedError86plus];
    
    %{
% NEW/CORRECT INDICES OF error_result_vector
1-	Misclassificationstest
2-	count2test
3-	testacc
4-      nonWarnPercGENERAL
5-	nonWarnPercWhite
6-	nonWarnPercBlack
7-	nonWarnPercHisp
8-	nonWarnPercMale
9-	nonWarnPercFemale
10-	nonWarnPerc1625
11-	nonWarnPerc2635
12-	nonWarnPerc3645
13-	nonWarnPerc4655
14-	nonWarnPerc5665
15-	nonWarnPerc6675
16-	nonWarnPerc7685
17-	nonWarnPerc86plus
18-     falsePositiveRateGENERAL
19-	falsePositiveRateWhite
20-	falsePositiveRateBlack
21-	falsePositiveRateHisp
22-	falsePositiveRateMale
23-	falsePositiveRateFemale
24-	falsePositiveRate1625
25-	falsePositiveRate2635
26-	falsePositiveRate3645
27-	falsePositiveRate4655
28-	falsePositiveRate5665
29-	falsePositiveRate6675
30-	falsePositiveRate7685
31-	falsePositiveRate86plus
32 -    balancedErrorGENERAL
33-	balancedErrorWhite
34-	balancedErrorBlack
35-	balancedErrorHispanic
36-	balancedErrorMale
37-	balancedErrorFemale
38-	balancedError1625
39-	balancedError2635
40-	balancedError3645
41-	balancedError4655
42-	balancedError5665
43-	balancedError6675
44-	balancedError7685
45-	balancedError86plus
        %}
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
%{ 
OLD RESULT VECTOR
        error_result_vector = [misclassificationstest, count2test, testacc, testTP, testFP, testFN, testTN, testWhiteFP, ...
            testWhiteFN, testWhiteTN, testWhiteTP, testnumW, testBlackFP, testBlackFN, testBlackTP, testBlackTN, testnumB, ...
            testHispanicFN, testHispanicFP, testHispanicTP, testHispanicTN, testnumH, testMaleFP, testMaleFN, testMaleTP, testMaleTN, ...
            testnumM, testFemaleFP, testFemaleFN, testFemaleTP, testFemaleTN, testnumF, nonWarnPercWhite, nonWarnPercBlack, ...
            nonWarnPercHispanic, nonWarnPercMale, nonWarnPercFemale, falsePositiveRateWhite, falsePositiveRateBlack, ...
            falsePositiveRateHispanic, falsePositiveRateMale, falsePositiveRateFemale, falsePositiveRateGENERAL,balancedErrorWhite, balancedErrorBlack, ...
            balancedErrorHispanic, balancedErrorMale, balancedErrorFemale, balancedErrorGENERAL,F1General, F1White, F1Black, F1Hispanic, F1Male, F1Female];
%}
        
        
        %{
% OLD INDICES OF error_result_vector
1-	Misclassificationstest
2-	count2test
3-	testacc
4-	testTP
5-	testFP
6-	testFN
7-	testTN
8-	testWhiteFP
9-	testWhiteFN
10-	testWhiteTN
11-	testWhiteTP
12-	testnumW
13-	testBlackFP
14-	testBlackFN
15-	testBlackTP
16-	testBlackTN
17-	testnumB
18-	testHispanicFN
19-	testHispanicFP
20-	testHispanicTP
21-	testHispanicTN
22-	testnumH
23-	testMaleFP
24-	testMaleFN
25-	testMaleTP
26-	testMaleTN
27-	testnumM
28-	testFemaleFP
29-	testFemaleFN
30-	testFemaleTP
31-	testFemaleTN
32-	testnumF
33-	nonWarnPercWhite
34-	nonWarnPercBlack
35-	nonWarnPercHisp
36-	nonWarnPercMale
37-	nonWarnPercFemale
38-	falsePositiveRateWhite
39-	falsePositiveRateBlack
40-	falsePositiveRateHisp
41-	falsePositiveRateMale
42-	falsePositiveRateFemale
43 - falsePositiveRateGENERAL
44-	balancedErrorWhite
45-	balancedErrorBlack
46-	balancedErrorHispanic
47-	balancedErrorMale
48-	balancedErrorFemale
49- balancedErrorGENERAL
50- F1White
51- F1Black
52- F1Hispanic
53- F1Male
54- F1Female
        %}
