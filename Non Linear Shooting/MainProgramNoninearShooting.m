func=input('Enter the function,using this formate"%@(x,y,z,k) equation": '); 
initialValues=input('Enter the initialValues"y(x0)=y0,using this formate [x0,y0]: ');
desiredPoint=input('Enter the DesiredPoint"y(xn)=yn",using the value of xn : ');
increment=input('Enter the value of increment "h(step size)": ');
guesses=input('Enter the guess value",using the value of r1 and r2 : ');
Y=nonLinearShootingMethod(func, initialValues, desiredPoint, increment, guesses); %calling function
disp(Y);
X =initialValues(1):increment:desiredPoint;
plot(X,Y,'o');
hold on;
plot(X,Y,'r');
xlabel('X axis');
ylabel('Y axis');
%check the function use the below code without % in command file
%@(x,y,z) 6*y^2-x
%[0,1]
%[1,5]
%(1/3)
%[1.2,1.5]