
clc;
clear fig;
dx = 1; %input('Enter the Grid spacing or the value of dx or h : ');
dt = 1/8; %input('Enter the Time step or the value of dt ot k: ');
simulationTime=0.625; %input('Enter the domain length or the final value of l : ');
domainLength=8; %input('Enter the Simulation time or the final value of t  : ');
c=2;  %input('Enter the value of c  : ');
bc=[0,0];  % input('Enter the boumdary condition [u(0,t), u(l,t)] : ');&
icf=@(x,t) 4*x-0.5*x^2; % input('Enter the initial condition "u(x,0)" : ');
u=explicitHeatE(domainLength,simulationTime,icf,bc,c,dx,dt);
disp(u);

x =0:dx:domainLength; %Grid points x=j 
subplot(2,1,1);
plot(x,u)
xlabel('Position');
ylabel('Time');

hold on;
subplot(2,1,2);
iteration=0;
while (iteration<2000)
    iteration=iteration+1;
    if(mod(iteration,10)==0)
    imagesc(u);
    colorbar;
    drawnow;
    end
end
xlabel('Position');
ylabel('Time');

