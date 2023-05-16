% Adams Bashforth Moulton 4-Step Method For Solving First Order
% Differential Equation
% Multi Step Method
function YC = adamsBashforthMoulton4(func, initialValues, desiredPoint, increment)
X = initialValues(1): increment: desiredPoint;
desiredPoint=initialValues(1)+increment*3;
Y = ModifiedEuler(func, initialValues, desiredPoint, increment);    %Can Use Other Single Step Method
YP = Y; 
YC = Y;
for i = 5: length(X)
    YP(i) = abPredictor(i, func, X, YC, increment);
    YC(i) = amCorrector(i, func, X, YP, increment);
    YC(i) = amCorrector(i, func, X, YC, increment);
end
    function y = abPredictor(n, func, X, Y, h)
        y = Y(n-1) + ((h/24) * (55*func(X(n-1), Y(n-1)) - 59*func(X(n-2), Y(n-2)) + 37*func(X(n-3), Y(n-3)) - 9*func(X(n-4), Y(n-4))));
    end
    function y = amCorrector(n, f, X, Y, h)
        y = Y(n-1) + ((h/24) * (9*f(X(n), Y(n)) + 19*f(X(n-1), Y(n-1)) - 5*f(X(n-2), Y(n-2)) + f(X(n-3), Y(n-3))));
    end
end

% adamsBashforthMoulton4(@(x, y) (1+y^2),[0, 0],0.8,0.2)
