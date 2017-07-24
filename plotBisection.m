function [ output_args ] = plotBisection( fn ,xl ,xr, xu ,graphlimit1 ,graphlimit2  )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

i =0;

    clf
    
    x = linspace(graphlimit1,graphlimit2 );
    y= fn(x);
    plotBi,plot(x, y)
    grid on;
    hold on;
            pause(0.5);
hold on
    x1 = linspace(xl,xl,length(y));
    plotBi,plot(x1,y,'m')
    
        pause(0.5);
        
    hold on;
     x2 = linspace(xu,xu,length(y));
    plotBi,plot(x2,y,'g')
   hold on;
      pause(0.5);
    hold on;
     x3 = linspace(xr,xr,length(y));
    plotBi,plot(x3,y,'r')
            pause(0.5);

   hold on;
    i = i+1;

end

