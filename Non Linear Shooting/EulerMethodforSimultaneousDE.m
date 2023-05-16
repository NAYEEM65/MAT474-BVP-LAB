function [y]= EulerMethodforSimultaneousDE(funcs,initialValues,desiredPoint,increment) 
x =initialValues(1):increment:desiredPoint; 
y(1)= initialValues(2);
z(1)= initialValues(3);

for i = 1 : length(x)-1 
 y(i+1)=y(i)+increment*(funcs{1}(x(i),y(i),z(i)));
 z(i+1)=z(i)+increment*(funcs{2}(x(i),y(i),z(i)));
end
end
%check the function use the below code without % in command file
% EulerMethodforSimultaneousDE({@(x,y,z) (x+y+z),@(x,y,z) (1+y+z)},[0,1,-1],1,0.5)