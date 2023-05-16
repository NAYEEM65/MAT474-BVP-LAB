function [Y]= RK4forSimultaneousDE(funcs, initialValues, desiredPoint, increment)
X= initialValues(1):increment:desiredPoint;
Y= initialValues(2);
Z= initialValues(3);
for i= 1: length(X)-1
 k1= increment*funcs{1}(X(i), Y(i), Z(i));
 l1= increment*funcs{2}(X(i), Y(i), Z(i));
 k2= increment*funcs{1}(X(i)+(increment/2), Y(i)+(k1/2), Z(i)+(l1/2));
 l2= increment*funcs{2}(X(i)+(increment/2), Y(i)+(k1/2), Z(i)+(l1/2));
 k3= increment*funcs{1}(X(i)+(increment/2), Y(i)+(k2/2), Z(i)+(l2/2));
 l3= increment*funcs{2}(X(i)+(increment/2), Y(i)+(k2/2), Z(i)+(l2/2));
 k4= increment*funcs{1}(X(i)+increment, Y(i)+k3, Z(i)+l3);
 l4= increment*funcs{2}(X(i)+increment, Y(i)+k3, Z(i)+l3);
 Y(i+1)= Y(i)+(1/6)*(k1+2*k2+2*k3+k4);
 Z(i+1)= Z(i)+(1/6)*(l1+2*l2+2*l3+l4);
end

%check the function use the below code without % in command file
% RK4forSimultaneousDE({@(x,y,z) (x+y+z),@(x,y,z) (1+y+z)},[0,1,-1],1,0.5)