function Y = linearShootingMethod(func, initialValues, desiredPoint,targetValue,increment)
f{1}= @(x, y, z) z;
% IVP: 1 With r(x) Term...............................................
f{2}= @(x, y, z) func(x, y, z, 1);
I = [initialValues(1), initialValues(2), 0];
D = desiredPoint(1);
U =RK4forSimultaneousDE(f, I, D, increment); %Calling function
% IVP: 2 Without r(x) Term.............................................
f{2}= @(x, y, z) func(x, y, z, 0);
I = [initialValues(1), 0, 1];
V =RK4forSimultaneousDE(f, I, D, increment); %Calling function
%Solving Method
n=length(U);
for i = 1 :n 
 Y(i)=U(i) + ((targetValue-U(n))/V(n))* V(i);
end
%check the function use the below code without % in command file
%linearShootingMethod(@(x,y,z,k) (((-2*z)/x)+((2*y)/x.^2)+(sin(log(x))/x.^2)*k),[1,1],2,2,0.2)