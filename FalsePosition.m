function [ Xr,numberOfIterations ,time , accuracy ,allIterations,allErrors ] = FalsePosition( funct,lower , upper,iter,prec)
    
    outputFile = 'FalsePositionOUTPUT.txt';

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

    accuracy = 1000;

    Xl = lower;
    Xu = upper;
     
    upperX = Xu;
    lowerX = Xl;
    
    Fxl = fn(Xl);
    Fxu =  fn(Xu);
    A=[];
    B=[];
    C=[];
    D=[];
    A=[A;Xl,Xu];
    B=[B;Fxl,Fxu];
    Xr = ((Xl*Fxu)- (Xu*Fxl))/(Fxu - Fxl);
    Fxr =  fn(Xr);
    C=[C;Xr,Xr];
    D=[D;Fxr,0];
    temp = Xr;
    plotting =0;
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

if (Fxu * Fxl) == 0
            accuracy = 0;

    if Fxu == 0
        plotting = 0;
        Xr = xu;
    else
        plotting = 0;
        Xr = xl;
    end
else if (Fxu * Fxl)> 0
        plotting = 0;
        Xr = 0;
        accuracy = -1;
        allIterations = allIterations();
        allErrors = allErrors();

    else
            plotting = 1;
                final = 0;

    while (i <= maxIterations )
    if (Fxl * Fxr)< 0
    Xu = Xr;
    temp = Xr;
    Xr = ((Xl*Fxu)- (Xu*Fxl))/(Fxu - Fxl);
    upperX = [upperX; Xu];
    lowerX = [lowerX; Xl];
    elseif (Fxu * Fxr)< 0
    Xl = Xr;
    temp = Xr;
    Xr = ((Xl*Fxu)- (Xu*Fxl))/(Fxu - Fxl);
    upperX = [upperX; Xu];
    lowerX = [lowerX; Xl];
      elseif (Fxr) == 0
            Xr = Xr;
            upperX = [upperX; Xu];
    lowerX = [lowerX; Xl];
        final = 1;
        end
    
    Fxl = fn(Xl);
    Fxu =  fn(Xu);
    Fxr =  fn(Xr);
    A=[A;Xl,Xu];
    B=[B;Fxl,Fxu];
    C=[C;Xr,Xr];
    D=[D;Fxr,0];
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
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ploting
    if( plotting == 1)
        
x=linspace(lower,upper);
    y=fn(x);
    plotFp,plot(x,y);
    hold on;
    x=[lower,upper];
    y=[0,0];
    plotFp,plot(x,y,'k'); hold on;
    i=1;
    k=size(A);
    v=k(1);
    while(i<=v)
    x=A(i,:);
    y=B(i,:);

    plotFp,plot(x,y,'r'); hold on;
    i=i+1;
    end
    i=1;
    k=size(C);
    v=k(1);
    while(i<=v)
    x=C(i,:);
    y=D(i,:);

    plotFp,plot(x,y,'g--');
    i=i+1;
    end
    end
    
    
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
 