function [y]=ModifiedEuler(func, initialValues, desiredPoint, increment)
x=initialValues(1):increment:desiredPoint;
y(1)=initialValues(2);
for i=1:length(x)-1
    k1=increment*func(x(i),y(i));
    y(i+1)=y(i)+increment*(func((x(i)+increment/2),y(i)+k1/2));
     x(i+1)=x(i)+increment;
end

% ModifiedEuler(@(x, y) (1+y^2),[0, 0],0.8,0.2)