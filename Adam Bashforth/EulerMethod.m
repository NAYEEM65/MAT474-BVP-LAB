function [y]=EulerMethod(func, initialValues, desiredPoint, increment)
x=initialValues(1):increment:desiredPoint;
y(1)=initialValues(2);
for i=1:length(x)-1
    y(i+1)=y(i)+increment*func(x(i),y(i));
    x(i+1)=x(i)+increment;
end

%EulerMethod(@(x, y) (1+y^2),[0, 0],0.8,0.2)