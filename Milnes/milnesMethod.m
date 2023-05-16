function [YC]= milnesMethod(func, initialValues, desiredPoint, increment)
X= initialValues(1): increment: desiredPoint;
desiredPoint=desiredPoint-increment;
Y= EulerMethod(func, initialValues,desiredPoint, increment);
YP = Y; YC = Y;
for i= length(Y): length(X)-1
 YP(i+1)= milnesPredictor(i, func, X, YC, increment);
 YC(i+1)= milnesCorrector(i, func, X, YP, increment);
 YC(i+1)= milnesCorrector(i, func, X, YC, increment);
end
 function y= milnesPredictor(n, f, X, Y, h)
 y= Y(n-3) + ((4*h)/3)*(2*f(X(n-2), Y(n-2))-f(X(n-1), Y(n-1))+2*f(X(n), Y(n)));
 end
 function y= milnesCorrector(n, f, X, Y, h)
 y= Y(n-1) + (h/3)*(f(X(n-1), Y(n-1))+4*f(X(n), Y(n))+f(X(n+1), Y(n+1)));
 end
end

% milnesMethod(@(x, y) (1+y^2),[0, 0],0.8,0.2)