% Solve the IVP Dy=y-x^2 y(0)=1 by using P_C method in p(EC)^m
%mode
% with h=0.1, where D is the differential operator with respect to x
%
function y_c=P_C_PEC_model(a,h,n,y0,M)
x=a:h:n*h;
f=inline('y-x^2');
for i=1:1:3
    y_p=R_K_method(a,h,n,y0,f);
    f_eva(i)=f(x(i),y_p(i));
end
y_c=y_p;
for i=3:1:n
    y_p(i+1)=y_p(i)+(h/12)*(23*f_eva(i)-16*f_eva(i-1)+5*f_eva(i-2));
    for m=1:1:M
        f_eva(i+1)=f(x(i+1),y_p(i+1));
   y_p(i+1)=y_p(i)+(h/12)*(5*f_eva(i+1)+8*f_eva(i)-f_eva(i-1));
   y_p=y_c; 
    end
     fprintf('\t\ny(%0.2f)=%0.5f', x(i+1), y_c(i+1));
   
end
y_exact = exp(x)+x.^2+2*x+2;
plot(x,y_c,'r-*',x,y_exact,'g');
for i=1:1:n
    err(i)=abs(y_c(i)-y_exact(i));
end
error=err