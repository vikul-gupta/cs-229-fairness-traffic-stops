%{
readme

1) Run csvimport.m
2) run preprocessedited (takes 10min) or enter load('Preprocessed') to load
a .mat file with requisite info
3) run logisticregressionfinalfeatureprep
4) run ErrorAnalysispreprocessedited
4) run your choice of Logisticregressionfinal (for unconstrained),
    or logisticregressionfinalfairnessregAGE/GENDER/RACEFinalreg to run 
    constrained optimization
5) With resulting theta values, run optimizethreshold with appropriate inputs to determine 
    the logistic regression threshold minimizing balanced error
6) Run computeTestAccuracyEditedNew with appropriate parameters, and see comments in that file for list of outputs
%}