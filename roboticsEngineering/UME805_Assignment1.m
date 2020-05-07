%% UME805 - Robotics Engineering, Assignment 1
clc;
clear all;

%% Trajectory of a rigid-single-link manipulator
 %  using two cubics connected in a two segment spline
 %  w/ continuous acceleration at the intermediate via-point.
 
 % on start/origin
 vel_O = 0.0;
 theta_O = 0.0;
 % at via-point
 theta_1 = pi/6;
 % at goal/final_pos
 vel_F = 0.0;
 theta_F = pi/3;
 
 % cubics
 syms t;
 syms a10 a11 a12 a13;
 syms a20 a21 a22 a23;
 
 theta1 = a10 + a11*t + a12*t.^2 + a13*t.^3;
 theta2 = a20 + a21*t + a22*t.^2 + a23*t.^3;
 
 theta1dot = diff(theta1, t);
 theta2dot = diff(theta2, t);
 
 theta1ddot = diff(theta1dot, t);
 theta2ddot = diff(theta2dot, t);
 
 % time (sec.)
 t10 = 0.0; t11 = 1.0; % start to via-point
 t20 = t11; t21 = 2.0; % via-point to goal
 
 % evaluating cubics on start, via-point & goal conditions
 
    % theta_O = subs(theta1, t, t10); % [start position - segment1]
    eq1 = subs(theta1, t, t10) - theta_O;
    % theta_1 = subs(theta1, t, t11); % [via-point: end_pos - segment1]
    eq2 = subs(theta1, t, t11) - theta_1;
    
    % theta_1 = subs(theta2, t, t20); % [via-point: start_pos - segment2]
    eq3 = subs(theta2, t, t20) - theta_1;
    % theta_F = subs(theta2, t, t21); % [goal position- segment2]
    eq4 = subs(theta2, t, t21) - theta_F;
    
    % vel_O = subs(thetadot1, t, t10); % [start velocity - segment1]
    eq5 = subs(theta1dot, t, t10) - vel_O;
    % vel_F = subs(thetadot2, t, t21); % [final velocity -segment2]
    eq6 = subs(theta2dot, t, t21) - vel_F;
    
    % vel@via-point[segment1] = vel@via-point[segment2]
    % subs(theta1dot, t, t11) = subs(theta2dot, t, t20);
    eq7 = subs(theta1dot, t, t11) - subs(theta2dot, t, t20);
    
    % accel@via-point[segment1] = accel@via-point[segment2]
    % subs(theta1ddot, t, t11) = subs(theta2ddot, t, t20);
    eq8 = subs(theta1ddot, t, t11) - subs(theta2ddot, t, t20);
    
    EQ = [eq1 eq2 eq3 eq4 eq5 eq6 eq7 eq8];
    
 %  calculating cubic coefficients
 %  Ax=B
 x = [a10 a11 a12 a13 a20 a21 a22 a23];
 for i=1:8 
    A(i,:) = jacobian(EQ(i), x);
    B(i,1) = -subs(EQ(i), x, zeros(1,8));
 end
 x = A\B;
 a10 = double(x(1)); a11 = double(x(2));
 a12 = double(x(3)); a13 = double(x(4));
 a20 = double(x(5)); a21 = double(x(6));
 a22 = double(x(7)); a23 = double(x(8));
 
 % step size, no of steps and time series
 h = 0.001; % (sec.)
 N_stepsSeg1 = (t11-t10)/h;
 N_stepsSeg2 = (t21-t20)/h;
 T1 = linspace(t10, t11, N_stepsSeg1);
 T2 = linspace(t20, t21, N_stepsSeg2);
 T = [T1(1:end) T2(2:end)];
 
 % Reference Trajectories
   % Segment 1
   theta_S1 = a10 + a11*T1 + a12*T1.^2 + a13*T1.^3;
   thetadot_S1 = a11 + 2*a12*T1 + 3*a13*T1.^2;
   thetaddot_S1 = 2*a12 + 6*a13*T1;
   % Segment 2
   theta_S2 = a20 + a21*T2 + a22*T2.^2 + a23*T2.^3;
   thetadot_S2 = a21 + 2*a22*T2 + 3*a23*T2.^2;
   thetaddot_S2 = 2*a22 + 6*a23*T2;
   % Complete Reference Trajectory(Seg1 + Seg2)
   theta_ref = [theta_S1(1:end) theta_S2(2:end)];
   thetadot_ref = [thetadot_S1(1:end) thetadot_S2(2:end)];
   thetaddot_ref = [thetaddot_S1(1:end) thetaddot_S2(2:end)];
 
%% Trajectory Following Control
