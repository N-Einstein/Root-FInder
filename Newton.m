function [ X2,numberOfIterations ,time , accuracy ,allIterations,allErrors, errorBound ] = Newton( Func,value ,iter,prec)

    outputFile = 'NewtonOUTPUT.txt';

    tic
    val = str2double(value);
    precision = str2double(prec);
    iterations = str2num(iter);
    X1 = val;
    syms x;
    S = vectorize(char(Func));
    eval(['fn = @(x) ' S]);
    Fx = fn;
    dFx = diff(Fx,x);
    d2Fx=diff(dFx,x);
    X2 = double(X1- subs(Fx,X1)/subs(dFx,X1));
    accuracy = 100;
    temp = X2;
    allIterations = zeros(1,1);
    allIterations(1,1)= temp;
    allErrors = zeros(0,1);

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
    i=1;
    while (i <= maxIterations )
        X1 = X2;
        X2 = double(X1- subs(Fx,X1)/subs(dFx,X1));
       accuracy = abs(X2-temp);
       new_row=(accuracy);
       allErrors=[allErrors;new_row];

      temp = X2;

        new_row=(temp);
       allIterations=[allIterations;new_row];
     numberOfIterations = i;
     if(abs(accuracy) < requiredAccuracy)

            i = maxIterations +1;
        end

        i  = i+1;
    end
    time = toc;


    alpha= fzero(matlabFunction(fn(x)),val);
    x=alpha; 
    prevDelta = alpha-X2;
    try
        q = abs((- subs(d2Fx)*abs(prevDelta)^2)/(2*subs(dFx)));
    catch 
        q=0;
    end
    errorBound=eval(q);
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
     fileID = fopen(outputFile,'w');
     
    fprintf(fileID, 'The solution is %12.5f\n\n',double(temp)); 
    fprintf(fileID, 'Time taken is %12.7f seconds\n\n',time); 
    fprintf(fileID, 'Number of iterations is %d\n\n\n', numberOfIterations);
    fprintf(fileID, 'Theoritical error bound is %d\n\n\n', errorBound);
     
    %print title line
    fprintf(fileID, '%7s%12s%12s\n', 'Iteration', 'Xi', '|Ea|');

    %print the table
    for j = 1 : size(allIterations)

        fprintf(fileID, '%4s%5s', num2str(j - 1), ''); %iteration

        disp(j);
        fprintf(fileID, '%12.5f', allIterations(j, 1)); %Xi
        
        if (j ~= 1) 
            fprintf(fileID, '%12.5f', allErrors(j - 1, 1)); %absolute error
        end

        fprintf(fileID, '\n');    

    end
   
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
end