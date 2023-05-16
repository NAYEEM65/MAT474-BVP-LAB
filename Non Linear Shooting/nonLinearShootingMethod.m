function y = nonLinearShootingMethod(func, initialValues, desiredPoint, increment, guesses)
f{1}= @(x, y, z) z;
f{2}= @(x, y, z) func(x, y, z);
D= desiredPoint(1);
for i= 1: length(guesses) %IVP- 1 at i=1, IVP-2 at i=2
 I= [initialValues(1), initialValues(2), guesses(i)];
 Y(i, :)=  EulerMethodforSimultaneousDE(f, I, D, increment);
 if(((round(Y(i, length(Y))*10.^4))/(10.^4))-desiredPoint(2) == 0)
 y= Y(i, :);
 break;
 end
end
while(1)
 i= i+ 1; %IVP-n Continues
 m= length(Y);
 guesses(i)= guesses(i-1) + (desiredPoint(2)-Y(i-1, m))*(guesses(i-1)- guesses(i-2))/(Y(i-1, m)-Y(i-2, m));
 I= [initialValues(1), initialValues(2), guesses(i)];
 D= desiredPoint(1);
 Y(i, :)=  EulerMethodforSimultaneousDE(f, I, D, increment);
 if(((round(Y(i, length(Y))*10.^4))/(10.^4))-desiredPoint(2) == 0)
 y= Y(i, :);
 break;
  end
 end
end

% nonLinearShootingMethod(@(x,y,z) 6*y^2-x,[0,1],[1,5],(1/3),[1.2,1.5])