%function y= shooting_method_RK4
clc
clear all
a=1;
b=2;
alfa=1;
beta=2;
x(1)=a;
u1(1)=alfa;
u2(1)=0;
v1(1)=0;
v2(1)=1;
h=0.1;
n=(b-a)/h;
x=a+[0:n]*h;
f1=inline('0*x+0*u1+u2');
f2=inline('-(2/x)*u2+(-2/(x*x))*u1+sin(log(x))/(x*x)');
g1=inline('0*x+0*v1+v2');
g2=inline('-(2/x)*v2+(-2/(x*x))*v1');
for i=1:1:n+1
    k(1,1)=h*f1(u1(i),u2(i),x(i));
    k(1,2)=h*f2(u1(i),u2(i),x(i));
    k(2,1)=h*f1(u1(i)+(1/2)*k(1,1),u2(i)+(1/2)*k(1,2),x(i)+(h/2));
    k(2,2)=h*f2(u1(i)+(1/2)*k(1,1),u2(i)+(1/2)*k(1,2),x(i)+(h/2));
    k(3,1)=h*f1(u1(i)+(1/2)*k(2,1),u2(i)+(1/2)*k(2,2),x(i)+(h/2));
    k(3,2)=h*f2(u1(i)+(1/2)*k(2,1),u2(i)+(1/2)*k(2,2),x(i)+(h/2));
    k(4,1)=h*f1(u1(i)+k(3,1),u2(i)+k(3,2),x(i)+h);
    k(4,2)=h*f2(u1(i)+k(3,1),u2(i)+k(3,2),x(i)+h);
    u1(i+1)=u1(i)+(1/6)*(k(1,1)+2*k(2,1)+2*k(3,1)+k(4,1));
    u2(i+1)=u2(i)+(1/6)*(k(1,1)+2*k(2,1)+2*k(3,1)+k(4,1));
    %fprintf('u1(%d)=%f\tu2(%d)=%f\n',x(i),u1(i),x(i),u2(i));
end
for i=1:1:n+1
    k(1,1)=h*g1(v1(i),v2(i),x(i));
    k(1,2)=h*g2(v1(i),v2(i),x(i));
    k(2,1)=h*g1(v1(i)+(1/2)*k(1,1),v2(i)+(1/2)*k(1,2),x(i)+(h/2));
    k(2,2)=h*g2(v1(i)+(1/2)*k(1,1),v2(i)+(1/2)*k(1,2),x(i)+(h/2));
    k(3,1)=h*g1(v1(i)+(1/2)*k(2,1),v2(i)+(1/2)*k(2,2),x(i)+(h/2));
    k(3,2)=h*g2(v1(i)+(1/2)*k(2,1),v2(i)+(1/2)*k(2,2),x(i)+(h/2));
    k(4,1)=h*g1(v1(i)+k(3,1),v2(i)+k(3,2),x(i)+h);
    k(4,2)=h*g2(v1(i)+k(3,1),v2(i)+k(3,2),x(i)+h);
    v1(i+1)=v1(i)+(1/6)*(k(1,1)+2*k(2,1)+2*k(3,1)+k(4,1));
    v2(i+1)=v2(i)+(1/6)*(k(1,1)+2*k(2,1)+2*k(3,1)+k(4,1));
   % fprintf('v1(%d)=%f\tv2(%d)=%f\n',x(i),v1(i),x(i),v2(i));
end
y1=u1;
y2=v1;
w=(beta-y1(n+1))/y2(n+1);
for i=1:1:n+1
    y(i)=y1(i)+w*y2(i);
end
disp('output')
disp('exact value of y(x):');
c1=1.1392070132
c2=-0.0392070132
for i=1:n+1
    y_exact(i)=c1*x(i)+c2/(x(i)*x(i))-0.3*sin(log(x(i)))-0.1*cos(log(x(i)));
end
y_exact
Numerical_value=y
for i=1:n+1
    error(i)=abs(y_exact(i)-y(i));
end
error
plot(x,y,'r-o',x,y_exact,'g')


