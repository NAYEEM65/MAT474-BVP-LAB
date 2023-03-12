% Solve the IVP Dy=y-x^2 y(0)=1 by using 4-step adam bashforth method
% with h=0.1, where D is the differential operator with respect to x
%
function y = A_B_Method(a,h,n,y0)
clc
clear figure
y0=-1;
a=0;
h=0.2;
n=3;
x=a:h:n*h;
f = inline('-2*x-y');
format short
for i=1:1:4
    y= R_K_method(a,h,n,y0,f);
    f_value(i)=f(x(i),y(i));
    fprintf('\t\ny(%0.2f)=%0.5f', x(i), y(i));
end
for f=4:1:n
    y(i+1)=y(i)+(h/24)*(55*f_value(i)-59*f_value(i-1)+37*f_value(i-2)-9*f_value(i-3));
    f_value(i+1)=f(x(i+1), y(i+1));
    fprintf('\t\ny(%0.2f)=%0.5f', x(i+1), y(i+1));
    
end
y_exact = exp(x)+x.^2+2*x+2;
plot(x,y,'r-o',x,y_exact,'g');
for i=1:1:n
    err(i)=abs(y(i)-y_exact(i));
    fprintf('\t\ny(%0.2f)=%0.5f', x(i), err(i));
end
