function Y = RK3(func, x_initial, x_final, y_initial, increment)
X = x_initial : increment : x_final; Y(1) = y_initial;
for i = 2 : length(X)
   k1 = increment * func(X(i - 1), Y(i - 1));
   k2 = increment * func(X(i - 1) + (increment/2), Y(i - 1) + (k1/2));
   k3 = increment * func(X(i - 1) + increment, Y(i - 1) + 2 * k2 - k1);
   Y(i) = round((Y(i - 1) + (1 / 6) * (k1 + 4 * k2 + k3))*10^4)/(10.^4);
end
end
% f = @(x, y) ((x.^2 + y.^2) / 10);
% RK3(f, 0, .5, 1, .1)