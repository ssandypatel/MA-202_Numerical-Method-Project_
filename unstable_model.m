clc
clear all
close all

%% Solving ODEs using ode45

tspan = [0 100];                        % taking time span from 0 to 100
y0 = [2.172*10^14, 4713, 0.1853];       % [I F E] Initial values
[t, y] = ode45(@rates,tspan,y0);        % Solving ODEs using ode45

%% Plotting Graphs

figure;
subplot(311);
plot(t,y(:,1),'linewidth',2);
title("Unstable Model of Spruce Budworm");
xlabel('Time')
ylabel('  I  ')

subplot(312);
plot(t,y(:,2),'linewidth',2);
xlabel('Time')
ylabel('  F  ')

subplot(313);
plot(t,y(:,3),'linewidth',2);
xlabel('Time')
ylabel('  E  ')

%% Functions

function dydt = rates(~,y)    % ODEs of Unstable Model
 dydt = [1.52*y(1)*(1-y(1)/(335*y(2))) - 43190 * y(1)^2/((1.11*y(2))^2 + y(1)^2) ;
           0.095* y(2)*(1-y(2)*1/(25440*y(3)));
          ((0.92*y(3)*(1-y(3)))-0.00195*y(1)/y(2)) ];
end