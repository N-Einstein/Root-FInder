function [ X3,numberOfIterations ,time , accuracy ,allIterations,allErrors ] = secant( Func,val1,val2 ,iter,prec)
    
    outputFile = 'secantOUTPUT.txt';

    tic
    syms x;
    val1 = str2double(val1);
    val2 = str2double(val2);
    precision = str2double(prec);
    iterations = str2num(iter);
    S = vectorize(char(Func));
    eval(['fn = @(x) ' S]);
    X1 = val1;
    X2 = val2;

    numberOfIterations =0;
    if(precision ==0)
            requiredAccuracy = double(0.00001);

    else
            requiredAccuracy = double(precision);

    end
    if(iterations ==0)
            maxIterations = 50;

    else
            maxIterations = iterations;

    end
    X3 = X2 - fn(X2)*(X2-X1)/(fn(X2)-fn(X1));
    temp = X3;
      X1 = X2;
      X2 = X3;
    accuracy = 100;
    i=1;
    allIterations = zeros(1,1);
    allIterations(1,1)= temp;
    allErrors = zeros(0,1);
    while (i <= maxIterations )
      X3 =  X2 - fn(X2)*(X2-X1)/(fn(X2)-fn(X1));
      accuracy =abs( X3-temp) ;
     new_row=(accuracy);
    allErrors =[allErrors;new_row];
      temp = X3;
      X1 = X2;
      X2 = X3;
       new_row=(temp);
       allIterations=[allIterations;new_row];
              numberOfIterations = i;


        numberOfIterations = i;
        i = i+1;
     if(abs(accuracy) < requiredAccuracy)

            i = maxIterations +1;
        end
    end
    time = toc;



     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
     fileID = fopen(outputFile,'w');
     
    fprintf(fileID, 'The solution is %12.5f\n\n',temp); 
    fprintf(fileID, 'Time taken is %12.7f seconds\n\n',time); 
    fprintf(fileID, 'Number of iterations is %d\n\n\n', numberOfIterations);
     
    %print title line
    fprintf(fileID, '%7s%12s%12s\n', 'Iteration', 'Xi', '|Ea|%');

    %print the table
    for j = 1 : (numberOfIterations + 1)

        fprintf(fileID, '%4s%5s', num2str(j - 1), ''); %iteration

        fprintf(fileID, '%12.5f', allIterations(j, 1)); %Xi
        
        if (j ~= 1) 
            fprintf(fileID, '%12.5f', allErrors(j - 1)); %absolute error
        end

        fprintf(fileID, '\n');    

    end
   
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    


end
