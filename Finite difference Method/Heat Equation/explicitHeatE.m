function u=explicitHeatE(domainLength,simulationTime,icf,bc,c,dx,dt)
x =0:dx:domainLength; %Grid points x=j
t = 0:dt:simulationTime; %space points t=i
alpha=((c^2)*(dt))/(dx)^2;
u = zeros(length(t),length(x)); % function of u(x,t)
 for i=1:length(t)
   for j=1:length(x)
       if i>1 && j>1 && j<length(x)
        u(i,j)=alpha*u(i-1,j-1)+(1-2*alpha)*u(i-1,j)+alpha*u(i-1,j+1); 
       end
     u(i,1)=bc(1); %boundary condition
     u(i,length(x))=bc(2);  %boundary condition
     u(1,j)=icf((j-1)*dx,1*dt);  %initial condition
   end
 end
  % explicitHeatE(8,0.625,@(x,t)4*x-0.5*x^2 ,[0,0],2,1,1/8)