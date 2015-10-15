function xdot=f(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Xuyang Lou, Yuchun Li
%
% Project: Simulation of a hybrid system
%
% Name: f.m
%
% Description: Flow map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% global parameters
global k1 k2 r1 r2;

% states
x1=x(1);
x2=x(2);
q1=x(3);
q2=x(4);

% flow map, differential equations
xdot=[k1*(1-q2)-r1*x1;    k2*q1-r2*x2;    0;    0];

