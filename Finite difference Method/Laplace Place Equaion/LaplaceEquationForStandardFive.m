%Develope a program , to solving laplace equation 
%             using finite diffence Method 
%""""""""""""""""""Program start""""""""""""""""""""""""""""""""""""""""""
clc;
clear fig;
n=input('Enter the size of square plate: ');
%"""""""""construct square plate and assign initial value '0'"""""""""""""
% """"""""""u is a fuction """""""""""""""""""""""""""""""""""""""""""""""
for i=1:n
    for j=1:n
        u(i,j)=0;  
    end
end

%"""""""""""input boundary value on the square plate"""""""""""""""""""""""
fprintf('\n Upper side values from Left to Right \n');
for i=1:n
    u(1,i)=input('Enter value : ');
end

fprintf('\n Lower side values from Left to Right \n');
for i=1:n
    u(n,i)=input('Enter value : ');
end

fprintf('\n Left side values from Top to Bottom \n');
for i=2:n-1
    u(i,1)=input('Enter value : ');
end

fprintf('\n Right side values from Top to Bottom \n');
for i=2:n-1
    u(i,n)=input('Enter value : ');
end

%"""Find the middle value of square plate""""""""""""""""""""""""""""""
%"""""""Using Standard Five Point Formula""""""""""""""""""""""""""""""  
for i=2:n-1
    for j=2:n-1
        u(i,j)=(u(i-1,j)+u(i+1,j)+u(i,j+1)+u(i,j-1))/4;
    end
end
%"""""""""""""""""""""""""""""""""""OUTPUT"""""""""""""""""""""""""""""
 for i=2:n-1
    for j=2:n-1
       fprintf('u(%d,%d)=%.3f\n',i,j,u(i,j));
    end
 end

%"""""""""""Jacobi's iterative formula"""""""""""""""""""""""""""""""""""
it=input('Iteration are you want : \n');
for k=1:it
 for i=2:n-1 
    for j=2:n-1
        u(i,j)=(u(i-1,j)+u(i+1,j)+u(i,j+1)+u(i,j-1))/4;
    end
  end

fprintf('\n Iteration It=%d \n',k);
%"""""""""""Output """"""""""""""""""""""""""""""""""""""""""""""""""""""
 for i=2:n-1
    for j=2:n-1
       fprintf('u(%d,%d)=%.3f\n',i,j,u(i,j));
    end
 end
end







