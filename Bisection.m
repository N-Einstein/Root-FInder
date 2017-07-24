function [ Xr ,numberOfIterations ,time , accuracy , allIterations,allErrors ] = Bisection( funct ,  lower , upper, iter,prec)

    outputFile = 'BisectionOUTPUT.txt'

    tic
    lower = str2double(lower);
    upper = str2double(upper);
    precision = str2double(prec);
    iterations = str2num(iter);
    syms x;
    S = vectorize(char(funct));
    eval(['fn = @(x) ' S]);
    allIterations = zeros(1,1);
    allErrors = zeros(0,1);
    
   upperX = zeros(1,1);
   lowerX = zeros(1,1);

    Xl = lower;
    Xu = upper;
    Xr = (Xl + Xu)/2;
    allIterations(1,1)= Xr;
    
    upperX = Xu;
    lowerX = Xl;

    Fxl = subs(fn , Xl);
    Fxu =  subs(fn , Xu);
    Fxr =  subs(fn , Xr);
    temp = Xr;

    numberOfIterations =0;
    if(precision ==0)
            requiredAccuracy = double(0.00001);
                        k = log2(Xu - Xl) - log2(requiredAccuracy) ;


    else
            requiredAccuracy = double(precision);
                                    k = log2(Xu - Xl) - log2(requiredAccuracy) ;


    end
    if(iterations ==0)
            maxIterations = 50;

    else
            maxIterations = iterations;

    end
    accuracy = 100;
    i =1;
    graphlimit1 = Xl;
    graphlimit2 = Xu;
    
    if (Fxu * Fxl) == 0
                accuracy = 0;

    if Fxu == 0
        Xr = xu;
    else
        Xr = xl;
    end
else if (Fxu * Fxl)> 0
        Xr = 0;
        accuracy = -1;
        allIterations = zeros(0,0);
        allErrors = zeros(0,0);
    else
    final = 0;
    while (i <= maxIterations )
     plotBi,plotBisection(fn,Xl ,Xr, Xu ,graphlimit1 ,graphlimit2)

        if (Fxl * Fxr)< 0
    Xu = Xr;
    temp =Xr;
    Xr = (Xl + Xu)/2;
     upperX = [upperX; Xu];
    lowerX = [lowerX; Xl];
    elseif (Fxu * Fxr)< 0
    Xl = Xr;
    temp = Xr;
    Xr = (Xl + Xu)/2;
     upperX = [upperX; Xu];
    lowerX = [lowerX; Xl];
        elseif (Fxr) == 0
            Xr = Xr;
            upperX = [upperX; Xu];
    lowerX = [lowerX; Xl];
        final = 1;
        end

           Fxl = subs(fn , Xl);
    Fxu =  subs(fn , Xu);
    Fxr =  subs(fn , Xr);
        accuracy = abs(Xr - temp);

        new_row=(accuracy);
       allErrors=[allErrors;new_row];


        oldRoot = Xr;
        new_row=(oldRoot);
       allIterations=[allIterations;new_row];
              numberOfIterations = i;
    

        if( final == 1||(abs(accuracy) < requiredAccuracy))
            i = maxIterations +1;
        end

        i  = i+1;
    end
    end 
    time = toc;
    
    
    
    
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
     fileID = fopen(outputFile,'w');
     
    fprintf(fileID, 'The solution is %12.7f\n\n',Xr); 
    fprintf(fileID, 'Time taken is %12.7f seconds\n\n',time); 
    fprintf(fileID, 'Number of iterations is %d\n\n\n', numberOfIterations);
     
    %print title line
    fprintf(fileID, '%7s%12s%12s%12s%12s\n', 'Iteration', 'Xl', 'Xu', 'Xr', '|Ea|');

    %print the table
    for j = 1 : (numberOfIterations)

        fprintf(fileID, '%4s%5s', num2str(j), ''); %iteration

        fprintf(fileID, '%12.5f', lowerX(j)); %Xl

        fprintf(fileID, '%12.5f', upperX(j)); %Xu
       
        fprintf(fileID, '%12.5f', allIterations(j, 1)); %Xr
        
        if (j ~= 1) 
            fprintf(fileID, '%12.5f', allErrors(j - 1)); %absolute error
        end

        fprintf(fileID, '\n');    

    end
   
    fclose(fileID);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    

    
end

