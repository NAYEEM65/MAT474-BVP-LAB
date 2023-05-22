clc;
clear fig;
func=input('Enter the function,using this formate"@(x,y) equation": ');  %func=input();
initialValues=input('Enter the initialValues"y(x0)=y0,using this formate [x0,y0]: ');
desiredPoint=input('Enter the DesiredPoint"y(xn)=yn",using the value of xn : ');
increase=input('Enter the value of increment "h(step size)": ');
Y= adamsBashforthMoulton3(func, initialValues, desiredPoint, increase);% calling function
disp(Y);
X =initialValues(1):increase:desiredPoint;
plot(X,Y,'o');
hold on;
plot(X,Y,'r');
xlabel('X axis');
ylabel('Y axis');
y0=-1;
a=0;
h=0.2;
n=3;

y_exact = -3*exp(-X)-2*X+2;
plot(X,Y,'r-o',X,y_exact,'g');
for i=1:1:n
    err(i)=abs(Y(i)-y_exact(i));
    fprintf('\t\ny(%0.2f)=%0.5f', X(i), err(i));
end
%check the function use the below code without % in command fil
%@(x, y) (1+y^2)
%[0,0]
% 0.8
% 0.2