filename = 'CT-clean.csv';
formatSpec = '%C%C%{yyyy-MM-dd}D%{HH:mm}D%C%C%f%C%C%C%f%f%C%C%C%C%C%C%C%C%C%C%C%C';
T = readtable(filename,'Delimiter',',', ...
    'Format',formatSpec);


