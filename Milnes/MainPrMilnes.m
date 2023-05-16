func=input('Enter the function,using this formate"%@(x,y,z,k) equation": '); 
initialValues=input('Enter the initialValues"y(x0)=y0,using this formate [x0,y0]: ');
desiredPoint=input('Enter the DesiredPoint"y(xn)=yn",using the value of xn : ');
increment=input('Enter the value of increment "h(step size)": ');
Y=milnesMethod(func, initialValues, desiredPoint, increment);
disp(Y);
X =initialValues(1):increment:desiredPoint;
plot(X,Y,'o');
hold on;
plot(X,Y,'r');
xlabel('X axis');
ylabel('Y axis');
%check the function use the below code without % in command fil
%@(x, y) (1+y^2)
%[0,0]
% 0.8
% 0.2