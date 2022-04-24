clc
clear all
close all

%% Solving ODEs using ode45

tspan = [0 140];                     % taking time span from 0 to 120
y0 = [0.5701, 26.5476, 0.000037];    % [I F E] initial values
[t1, y1] = ode45(@rates2,tspan,y0);  % solving ODEs at Te = 0.012
[t2, y2] = ode45(@rates3,tspan,y0);  % solving ODEs at Te = 0.33
[t3, y3] = ode45(@rates4,tspan,y0);  % solving ODEs at Te = 0.19

%% Plotting Graphs

figure;
plot(t1,y1(:,1),'Red',t2,y2(:,1),'Green',t3,y3(:,1),'Blue','linewidth',1.5);
legend("Te = 0.012", "Te = 0.33","Te = 0.75");
title("Stable Model of Spruce Budworm (I)");
xlabel('Time')
ylabel('  I  ')
  
figure;
plot(t1,y1(:,2),'Red',t2,y2(:,2),'Green',t3,y3(:,2),'Blue','linewidth',1.5);
legend("Te = 0.012", "Te = 0.33","Te = 0.75");
title("Stable Model of Spruce Budworm (F)");
xlabel('Time')
ylabel('  F  ')

figure;
plot(t1,y1(:,3),'Red',t2,y2(:,3),'Green',t3,y3(:,3),'Blue','linewidth',1.5);
legend("Te = 0.012", "Te = 0.33","Te = 0.75");
title("Stable Model of Spruce Budworm (E)");
xlabel('Time')
ylabel('  E  ')

figure;
subplot(311);
plot(t1,y1(:,1),'Blue','linewidth',1.5);
title("Stable Model of Spruce Budworm ");
xlabel('Time')
ylabel('  I  ')
  
subplot(312);
plot(t1,y1(:,2),'Blue','linewidth',1.5);
xlabel('Time')
ylabel('  F  ')

subplot(313);
plot(t1,y1(:,3),'Blue','linewidth',1.5);
xlabel('Time')
ylabel('  E  ')

%% Functions

function dydt = rates2(~,y)    % Stable Model ODEs at Te = 0.012
dydt = [(-3.2*y(1)*0+(1.52*y(1)*(1-(y(1)*(y(3)^2+0.012^2))/(335*y(2)*(y(3)^2))) - 43190 * (y(1)^2)/((1.11*y(2))^2 + y(1)^2)))  ;
           0.095* y(2)*(1-y(2)*1/(25440*y(3)));
          ((0.92*y(3)*(1-y(3)))-0.00195*(y(1)*(y(3)^2)/(y(2)*(y(3)^2)+0.012^2))) ];
end

function dydt = rates3(~,y)    % Stable Model ODEs at Te = 0.33
dydt = [(-3.2*y(1)*0+(1.52*y(1)*(1-(y(1)*(y(3)^2+0.33^2))/(335*y(2)*(y(3)^2))) - 43190 * (y(1)^2)/((1.11*y(2))^2 + y(1)^2)))  ;
           0.095* y(2)*(1-y(2)*1/(25440*y(3)));
          ((0.92*y(3)*(1-y(3)))-0.00195*(y(1)*(y(3)^2)/(y(2)*(y(3)^2)+0.33^2))) ];
end

function dydt = rates4(~,y)    % Stable Model ODEs at Te = 0.75
dydt = [(-3.2*y(1)*0+(1.52*y(1)*(1-(y(1)*(y(3)^2+0.75^2))/(335*y(2)*(y(3)^2))) - 43190 * (y(1)^2)/((1.11*y(2))^2 + y(1)^2)))  ;
           0.095* y(2)*(1-y(2)*1/(25440*y(3)));
          ((0.92*y(3)*(1-y(3)))-0.00195*(y(1)*(y(3)^2)/(y(2)*(y(3)^2)+0.75^2))) ];
end

