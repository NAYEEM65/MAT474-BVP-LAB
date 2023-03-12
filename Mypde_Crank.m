%solution of the PDE[Ut=d*uxx] with the foiiowing conditions:
%     (i) initial condition:fort=0,U=2x if x between 0 and 0.5,=2(1-x)if
%     greater han 0.5
%      (ii)Boundary condition:for t>0,U=0 at x=0 and 1
%solve the problem by using implicit Euler method
%================================================

function u_new = Mypde_Crank(d,dt, x0,xn,h,T)
n = (xn-x0)/h;
x=(0:n)*h;
r=d*dt/h^2;

%Following Statment is intial Condition
u_old = ini(x);
g = length(u_old);
N = g-1;

%Matrix of the coefficient of a

a(1)=0;

for i=2:1:N-1
      a(i)=-r;
end
%matrix of coefficient of b
  
for i=1:1:N-1
      b(i)=2*r;
end
%matrix of coefficient of c
for i=1:1:N-2
    c(i)=-r;
end
c(N-1)=0;
% The following two statements are boundary condition.
t=dt;
u_new(1)=left(t);

u_new(+1)=right(t);
%matrix of coefficient of d
d(1)=r*u_old(1)+(2-2*r)*u_old(2)+r*u_old(3)+r*u_new(1);
for i=2:1:N-2
     d(i)=r*u_old(i)+(2-2*r)*u_old(i+1)+r*u_old(i+2); 
end
d(N-1)=r*u_old(N-1)+(2-2*r)*u_old(N)+r*u_old(N+1)+r*u_new(N+1); 

u_new=u_old;

% T is the final time
for t=dt:dt:T
     % The following two statements are boundary condition.
     
     u_new(1)=left(t);
     u_new(n+1)=right(t);
     
     alfa(1)=b(1);
     beta(1)=d(1);
     
     
    for i=2:1:N-1
        alfa(i)=b(i)-(a(i)/alfa(i-1))*c(i-1);
    end
    for i=2:1:N-1
        beta(i)=d(i)-(a(i)/alfa(i-1))*beta(i-1);
    end
    u_new(N)=beta(N-1)/alfa(N-1);
    u_old=u_new;
    
    for i=N-1:-1:2
        u_new(i)=(beta(i-1)-c(i-1)*u_old(i+1))/alfa(i-1);
        u_old=u_new;
    end
    u_old=u_new;
    d(1)=r*u_old(1)+(2-2*r)*u_old(2)+r*u_old(3)+r*u_new(1);
    for i=2:1:N-2
     d(i)=r*u_old(i)+(2-2*r)*u_old(i+1)+r*u_old(i+2); 
    end
    d(N-1)=r*u_old(N-1)+(2-2*r)*u_old(N)+r*u_old(N+1)+r*u_new(N+1); 
    plot(x,u_new)
    
    
    
end
    
    
