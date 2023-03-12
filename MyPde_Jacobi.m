%Solution of the PDE Uxx+Uyy=2 wityh the following conditions:
%   (i) initial condition: U=1; -<x<1 and 0<y<1
%   (ii) Boundary Condition: U=0 at x=0,1 and y=0,1

% Solve the problem with step size  h = 0.1

%==============================================================

function u_val = MyPde_Jacobi(a,b,n,N)
% d = diffision Parameter
% dt = time increment
% n = stem number
% N = Number of Iteration
% T = final Time

clc
h = (b-a)/n;
x=a+[0:n]*h;
y=a+[0:n]*h;
 % Following statement is initial condition
u_old = ini(x,y,n); % External Function ini()
M = Matrix_M(n);
D = Matrix_D(n);
L = Matrix_L(n);
U = Matrix_U(n);

M==D-L-U;

% Determine of the jacobi iteration matrix
inv_D = inv(D);

J = inv_D*(L+U);
c1 = 2*h^2;
c = c1*ones((n-1)^2,1);
dbv1=vec_1(a,b,n);
bdv2=vec_2(a,b,n);
d= c-(dbv1+bdv2);
u_old1=u_old(2:n,2:n);
u_old1=u_old1;
u_old1=u_old1(:);

for i = 1:N
    u_new1 = J*u_old1 + inv_D *d;
    u_old1 = u_new1;
end
u_new1 = u_old1



