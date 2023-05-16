function [y]=RK2(func, initialValues, desiredPoint, increment)
x=initialValues(1):increment:desiredPoint;
y(1)=initialValues(2);
for i=1:length(x)-1
    k1=increment*func(x(i),y(i));
    k2=increment*func((x(i)+increment),(y(i)+k1));
    x(i+1)=x(i)+increment;
    y(i+1)=y(i)+(k1+2*k2+2*k3+k4)/6;
end

%RK4(@(x, y) (1+y^2),[0, 0],0.8,0.2)