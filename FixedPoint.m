function [ root ,numberOfIterations ,time , accuracy , allIterations,allErrors] = FixedPoint( funct ,initial, iter,prec )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    outputFile = 'FixedPointOUTPUT.txt';

    tic
    initial = str2double(initial);
    precision = str2double(prec);
    iterations = str2num(iter);
    syms x;
    S = vectorize(char(funct));
    eval(['fn = @(x) ' S]);
    degree = feval(symengine, 'degree', fn, x);
    a=char(funct);
    b=sym(a);
  
    %disp('fixed' + G(5));
    accuracy = 100;
    allIterations = zeros(1,1);
    allIterations(1,1)= initial;
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
    i =1;
    root = initial;
    oldRoot = root;
    plusX = 0;
    try
             coef = sym2poly(b);
    s = size(coef);
    constant = coef(s(2));
    fnc  = fn - coef(1)*(x^degree);
    fnc = -fnc;
    fnc = fnc/coef(1);
           catch
                   plusX = 1;
           end
    while (i <= maxIterations )

      if(degree ~= 0 && plusX == 0)
          
            temp = subs( fnc , initial);
           if ( temp <0 )
           
           if(plusX == 0)
               a = subs(fn , 0);
               if(a == constant )
                   equation2 = fn - coef(s(2)-1)*x;
                   equation2 = - equation2;
                   equation2 = equation2 /coef(s(2)-1);
                        root = subs(equation2, root);
                               G = equation2;


               else

                  equation2 = fn - coef(s(2))*x;
                   equation2 = - equation2;
                 equation2 = equation2 /coef(s(2));
                               root = subs(equation2, root);
                               G = equation2;


               end
           else
               root = subs(fn + x, root);
                G = fn + x;
               
           end;
                                                                                                         

          elseif (temp > 0 )
                         if(plusX == 0)

            temp2 = subs( fnc , root);

              root = power(temp2,1/double(degree));
                  G = power(fnc,1/double(degree));
 else
               root = subs(fn + x, root);
                G = fn + x;
               
           end;

           end
           

        else

            root = subs(fn + x, root);
                G = fn + x;

      end
      
        if(i>1)
        accuracy = abs(root - oldRoot);
         new_row=(accuracy);
       allErrors=[allErrors;new_row];
        end
        oldRoot = root;
        new_row=(oldRoot);
       allIterations=[allIterations;new_row];
              numberOfIterations = i;

        if(abs(accuracy) < requiredAccuracy)
            i = maxIterations +1;
        end

        i  = i+1;
    end


    time = toc;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ploting
    x=linspace(double(root - 50),double(root + 50));
    y= subs(G, x);
    fixed,plot(x,y, 'g'); hold on;
    y =x;
    fixed,plot(x,y);


    syms x
    alpha= fzero(matlabFunction(fn(x)),initial);
    y2= subs(G, alpha);
    y1=subs(G,double(root));
    y3=(y2-y1)/(alpha-double(root));
    x=alpha; 
    prevDelta = alpha-double(root);
    try
        q = abs(y3*prevDelta);
    catch 
        q=0;
    end
%    disp(y2);
 %   disp(y1);
  %  disp(alpha);
 %   disp(double(root));
    errorBound=eval(q);
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
     fileID = fopen(outputFile,'w');
     
    fprintf(fileID, 'The solution is %12.7f\n\n',double(root)); 
    fprintf(fileID, 'Time taken is %12.7f seconds\n\n',time); 
    fprintf(fileID, 'Number of iterations is %d\n\n\n', numberOfIterations);
    fprintf(fileID, 'Theoritical error bound is %d\n\n\n', errorBound);
 
    %print title line
    fprintf(fileID, '%7s%12s%12s\n', 'Iteration', 'Xi', '|Ea|');

    %print the table
    for j = 1 : (numberOfIterations)
        
        fprintf(fileID, '%4s%5s', num2str(j - 1), ''); %iteration

        fprintf(fileID, '%12.5f', double(allIterations(j))); %Xi
        
        if (j ~= 1) 
            fprintf(fileID, '%12.5f', double(allErrors(j - 1))); %absolute error
        end

        fprintf(fileID, '\n');    

    end
   
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    

end

