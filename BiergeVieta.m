function [root,numberofIterations,time,accuracy,Iterations,errors] = BiergeVieta(equation,initialValue,m,t)

    outputFile = 'BiergeVietaOUTPUT.txt';%output file name

    tic
    format long
    P0old=str2double(initialValue);
    str = equation;
    y=char(str);
    z=sym(y);
    syms x
    A=sym2poly(z);
    k=str2double(m);
    l=str2num(t);
    if(k==0)
      MaxNum=50;  
    else
      MaxNum=k;  
    end;
    if(l==0)
      Limit=10^-5;  
    else
      Limit=l;  
    end;
    error1=1;
    error2=1;
    i=1;
    Iterations = zeros(1,1);
    B = zeros(1,length(A));
    C = zeros(1,length(A)-1);
    Iterations(1,1)=P0old;
    Ab_Error=[];
    while(MaxNum>=error1&&error2>Limit)
        while(i<=length(A))
        if(i==1)
            B(i)=A(i);
        else
            B(i)=B(i-1)*P0old+A(i);
        end;
        i=i+1;
        end;
        i=1;
        while(i<=length(A)-1)
        if(i==1)
            C(i)=B(i);
        else
            C(i)=C(i-1)*P0old+B(i);
        end;
        i=i+1;
        end;
       P0new=P0old-(B(length(A))/C(length(A)-1));
       error2=abs(P0new-P0old);
       Ab_Error=[Ab_Error;error2];
       P0old=P0new;
       i=1; 
       error1=error1+1;
       new_row=(P0old);
       Iterations=[Iterations;new_row];
    end;
    root=P0old;
    time = toc;
    numberofIterations = error1-1;
    accuracy = error2;
    errors=Ab_Error;
    
    
    
    
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
     fileID = fopen(outputFile,'w');
     
    fprintf(fileID, 'The solution is %12.7f\n\n',root); 
    fprintf(fileID, 'Time taken is %12.7f seconds\n\n',time); 
    fprintf(fileID, 'Number of iterations is %d\n\n\n', numberofIterations);
     
    %print title line
    fprintf(fileID, '%7s%12s%12s\n', 'Iteration', 'Xi', '|Ea|');

    %print the table
    for j = 1 : (numberofIterations + 1)

        fprintf(fileID, '%4s%5s', num2str(j - 1), ''); %iteration

        fprintf(fileID, '%12.5f', Iterations(j)); %Xi
        
        if (j ~= 1) 
            fprintf(fileID, '%12.5f', errors(j - 1)); %absolute error
        end

        fprintf(fileID, '\n');    

    end
   
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    
    
    
end