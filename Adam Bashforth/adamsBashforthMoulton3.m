% Adams Bashforth Moulton 3-Step Method For Solving First Order
% Differential Equation
% Multi Step Method
function YC = adamsBashforthMoulton3(func, initialValues, desiredPoint, increase)
X = initialValues(1): increase: desiredPoint;
desiredPoint=initialValues(1)+increase*3;
Y = ModifiedEuler(func, initialValues, desiredPoint, increase);    %Can Use Other Single Step Method
YP = Y; 
YC = Y;
for i = 4 : size(X, 2)
    YP(i) = abPredictor(i, func, X, YC, increase);
    YC(i) = amCorrector(i, func, X, YP, increase);
    YC(i) = amCorrector(i, func, X, YC, increase);
end
    function y = abPredictor(n, func, X, Y, h)
        y = Y(n-1) + ((h/12) * (23*func(X(n-1), Y(n-1)) - 16*func(X(n-2), Y(n-2)) + 5*func(X(n-3), Y(n-3))));
    end
    function y = amCorrector(n, func, X, Y, h)
        y = Y(n-1) + ((h/12) * (5*func(X(n), Y(n)) + 8*func(X(n-1), Y(n-1)) - func(X(n-2), Y(n-2))));
    end
end

% adamsBashforthMoulton3(@(x, y) (1+y^2),[0, 0],0.8,0.2)
