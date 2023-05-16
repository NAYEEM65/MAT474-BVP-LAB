
clc;
clear fig;
dx =input('Enter the Grid spacing or the value of dx or h : ');
dt =input('Enter the Time step or the value of dt ot k: ');
simulationTime=input('Enter the domain length or the final value of l "u(l,t)": ');
domainLength=input('Enter the Simulation time or the final value of t  : ');
c=input('Enter the value of c  : ');
bc=input('Enter the boumdary condition [u(0,t), u(l,t)] : ');
icf=input('Enter the initial condition "u(x,0)" using this formate @(x,t) equation: ');

u=waveEqFDM(domainLength,simulationTime,icf,bc,c,dx,dt);
disp(u);
x =0:dx:domainLength; %Grid points  
plot(x,u)
xlabel('Position');
ylabel('Time');

%domainLength=1
%simulationTime=0.5
%icf=@(x,t) (x-x^2)/2
%bc=[0,0]
%c=1
%dx=0.1
%dt=0.1