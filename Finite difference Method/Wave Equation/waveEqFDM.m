function u=waveEqFDM(domainLength,simulationTime,icf,bc,c,dx,dt)
x =0:dx:domainLength; %Grid points 
t = 0:dt:simulationTime; %space points 
alpha=((c^2)*((dt)^2))/(dx)^2;
u = zeros(length(t),length(x)); % function of u(x,t)
 for i=1:length(t)
   for j=1:length(x)
       if i>1 && j>1 && j<length(x)
        if i==2
          u(i,j)=((alpha)*(u(i-1,j-1))+u(i-1,j+1))/2;  
        else
        u(i,j)=((alpha)*(u(i-1,j-1))+u(i-1,j+1))-u(i-2,j); 
        end
       end
     
     u(i,1)=bc(1); %boundary condition
     u(i,length(x))=bc(2);  %boundary condition
     u(1,j)=icf((j-1)*dx,1*dt);  %initial condition
     
   end
 end
 
% waveEqFDM(1,0.5,@(x,t) (x*(1-x))/2,[0,0],1,0.1,0.1)