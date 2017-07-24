function[Data] = ReadFromFile (filename)

percision = '0.00001';
max_iteration = '50';

fileID = fopen(filename);
Data = textscan(fileID, '%s','delimiter', '\n');

equation = Data{1}{1};

for i = 2:length(Data{1})
    line = strsplit(Data{1}{i});
    switch lower(line{1})
    case 'bisection'
        Bisection(equation, line{2}, line{3}, max_iteration, percision);
    case 'false'
        FalsePosition(equation, line{3}, line{4}, max_iteration, percision);
    case 'fixed'
        FixedPoint(equation, line{3}, max_iteration, percision);
    case 'newton'
        Newton(equation, line{3}, max_iteration, percision);
    case 'secant'
        secant(equation, line{2}, line{3}, max_iteration, percision);
    case 'bierge'
        BiergeVieta(equation, line{3}, max_iteration, percision);
    case 'general'
        generalMethod(equation, max_iteration, percision);
    case 'max'
        max_iteration = line{3};
    case 'precision'
        percision = line{2};
    otherwise
        disp('no')
    end    
end

fclose(fileID);