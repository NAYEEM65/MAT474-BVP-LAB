function u = ini(x)

%n is the length of the vector x
n=length(x);

% u is the output vector of the same size of x

for i=1:n
    if x(i)<=0.5
        u(i)=2*x(i);
    else
        u(i)=2*(1-x(i));
    end
end
