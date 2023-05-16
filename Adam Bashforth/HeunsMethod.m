function [y]= HeunsMethod(func,initialValues,desiredPoint,increment) 
x =initialValues(1):increment:desiredPoint; 
y(1)= initialValues(2);
for i = 1 : length(x)-1 
 k1= func(x(i), y(i));
 k2= func(x(i)+increment, y(i)+(increment*k1));
 y(i+1)= y(i)+(increment/2)*(k1+k2);
 x(i+1)=x(i)+increment;
 end
end

% HeunsMethod(@(x, y) (1+y^2),[0, 0],0.8,0.2)