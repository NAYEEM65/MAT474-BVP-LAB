function [y] = HeunsMethodforSimultaneousDE(funcs,initialValues,desiredPoint,increment) 
x =initialValues(1):increment:desiredPoint; 
y(1)= initialValues(2);
z(1)= initialValues(3);

for i = 1 : length(x)-1 
 k1= funcs{1}(x(i), y(i), z(i));
 l1= funcs{2}(x(i), y(i), z(i));
 k2= funcs{1}(x(i)+increment, y(i)+(increment*k1), z(i)+(increment*l1));  
 l2= funcs{2}(x(i)+increment, y(i)+(increment*k1), z(i)+(increment*l1)); 
 y(i+1)= y(i)+(increment/2)*(k1+k2);
 z(i+1)= z(i)+(increment/2)*(l1+l2);
end
end
%check the function use the below code without % in command file
% HeunsMethodforSimultaneousDE({@(x,y,z) (x+y+z),@(x,y,z) (1+y+z)},[0,1,-1],1,0.5)