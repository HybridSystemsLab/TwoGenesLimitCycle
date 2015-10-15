
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Xuyang Lou, Yuchun Li
%
% Project: Simulation of a two-gene network with binary hysteresis
%
% Name: run.m
%
% Description: run script
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function run

% set  global parameters
global k1 k2 r1 r2 th1 th2 h1 h2;
k1=1;k2=1;r1=1;r2=1;
th1=0.6;th2=0.5;
h1=0.1;h2=0.1;

% initial conditions
% first column: x1, second column: x2, third column: q1, fourth column: q2
z0=[ 0.5 0.5 0 1;     
     0.7 0.6 1 1;
     0.3 0.3 0 0;
     0.785 0.4 1 0];  % last initial choice: values on limit cycle

mark_color=['r' 'm' 'g' 'b'];

% simulation horizon
TSPAN=[0 10];
JSPAN = [0 20];

% rule for jumps
% rule = 1 -> priority for jumps
% rule = 2 -> priority for flows
rule = 1;

options = odeset('RelTol', 1e-6,'MaxStep', 0.1);


for i=1:4  % plot from different initial values
    x0=z0(i,:)';
    
    % simulate
    [t j x] = HyEQsolver(@f,@g,@C,@D,x0,TSPAN,JSPAN,rule,options);
    x1=x(:,1);
    x2=x(:,2);
    q1=x(:,3);
    q2=x(:,4);
            
    % plot solution
    figure(1);hold on;
    modificator{1} = mark_color(i);
    modificator{3} = 2;
    modificator{2} = 'LineWidth';    
    plotHarc(x1,j,x2,[],modificator);    % phase plot: x1 - x2
    xlabel('x1');
    ylabel('x2');
    
    % plot jump points
    text(0.8567, 0.63, 'O_1');
    text(0.5-0.05, 0.7666, 'O_2');
    text(0.2609-0.04, 0.4+0.03, 'O_3');
    text(0.7+0.02, 0.1624-0.01, 'O_4');
    
    hold on;
    % plot initial value
    plot(x0(1),x0(2),'mx','linewidth',2);
    
end

