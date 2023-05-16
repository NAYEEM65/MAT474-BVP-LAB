clc;
clear fig;
func=input('Enter the function,using this formate"@(x,y,z,k) equation": '); 
initialValues=input('Enter the initialValues"y(x0)=y0,using this formate [x0,y0]: ');
desiredPoint=input('Enter the DesiredPoint"y(xn)=yn",using the value of xn : ');
increment=input('Enter the value of increment "h(step size)": ');
targetValue=input('Enter the targetValue "y(xn)=yn",using the value of yn : ');
Y=linearShootingMethod(func, initialValues, desiredPoint,targetValue,increment);
fprintf(' %f \n',Y);
%check the function use the below code without % in command file
%@(x,y,z,k)(((-2*z)/x)+((2*y)/x.^2)+(sin(log(x))/x.^2)*k);
%[1,1]
%2
%0.2
%2