function value=D(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Xuyang Lou, Yuchun Li
%
% Project: Simulation of a hybrid system
%
% Name: D.m
%
% Description: Jump set
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% global parameters
global th1 th2 h1 h2;

% states
x1 = x(1);
x2 = x(2);
q1 = x(3);
q2 = x(4);

eta1 = (2*q1-1)*(-x1+th1+(1-2*q1)*h1);
eta2 = (2*q2-1)*(-x2+th2+(1-2*q2)*h2);

hx = eta1*eta2;

% jump condition
if hx <= 0
    value = 1; % report jump 
else
    value = 0; % do not report jump
end
