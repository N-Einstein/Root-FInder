function [roots,All_roots,numberofIterations,time,accuracy,Iterations,Ab_Error] = generalMethod(equation,m,n)

    outputFile = 'GeneralMethodOUTPUT.txt';

    tic
    format long
    S = vectorize(char(equation));
    eval(['fn = @(x) ' S]);
    A=(-100:0.5:100);
    i=1;
    error=1;
    count=0;
    check=0;
    Iterations =[];
    Ab_Error=[];
    All_roots=[];
    roots=[];
    t=0;
    numberofIterations=[];
    accuracy =[];
    while(i<length(A)-1)
    while(i<length(A)-1&&(fn(A(i))*fn(A(i+1))>0))   
    i=i+1;  
    end
    if(fn(A(i))==0&&t~=1)
    roots= multiplicity(roots,A(i),fn);
    t=0;
    elseif(fn(A(i+1))==0)   
    roots= multiplicity(roots,A(i+1),fn);
    t=1;
    else 
    if(fn(A(i))*fn(A(i+1))<0)    
    xL=A(i);
    xU=A(i+1);
    xr=(xL+xU)/2;
    Iterations=[Iterations;xr];
    k=str2double(m);
    l=str2num(n);
    if(k==0)
    maxNum=50;  
    else
    maxNum=k;  
    end;
    if(l==0)
     precision=10^-5;  
    else
     precision=l;  
    end;
    while(error > precision&&count<maxNum)
     temp=xr;
     if(fn(xr)*fn(xL)<0)
         xU=xr;
     else
         xL=xr;
     end 
     xr=(xL+xU)/2;
     error=abs(xr-temp);
     new_row=(xr);
     Iterations=[Iterations;new_row];
     Ab_Error=[Ab_Error;error];
     count=count+1;
    end
    All_roots=[All_roots;xr];
    numberofIterations=[numberofIterations;count];
    accuracy = [accuracy;error];
    error=1;
    count=0;
    check=check+1;
    end
    end
    i=i+1;
    end
    time = toc;


       
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
     fileID = fopen(outputFile,'w');
     
    fprintf(fileID, 'The solution is \n'); 
  
    
     for j = 1 : size(roots)
        fprintf(fileID, '%12.5f\n\n',roots(j)); 
     end
     for j = 1 : size(All_roots)
        fprintf(fileID, '%12.5f\n\n',All_roots(j)); 
    end
    
    fprintf(fileID, 'Time taken is %12.7f seconds\n\n',time); 
    fprintf(fileID, 'Number of iterations is %d\n\n\n', numberofIterations);
     
    %print title line
    fprintf(fileID, '%7s%12s%12s\n', 'Iteration', 'Xi', '|Ea|');

    %print the table
    for j = 1 : (numberofIterations + 1)

        fprintf(fileID, '%4s%5s', num2str(j - 1), ''); %iteration

        fprintf(fileID, '%12.5f', Iterations(j)); %Xi
        
        if (j ~= 1) 
            fprintf(fileID, '%12.5f', Ab_Error(j - 1)); %absolute error
        end

        fprintf(fileID, '\n');    

    end
    
    fclose(fileID);
   
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    


end

