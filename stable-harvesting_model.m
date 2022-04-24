clc
clear all
close all

%% Solving ODEs using ode45

tspan = [0 100];                        % taking time span from 0 to 100
y0 = [9, 40, 0.037];                    % [I F E] Initial values
[t1, y1] = ode45(@rates5,tspan,y0);     % solving ODEs without harvesting
[t2, y2] = ode45(@rates6,tspan,y0);     % solving ODEs with harvesting

%% Plotting Graphs

figure;
plot(t1,y1(:,1),'linewidth',2);
hold on
title("Stable Model of Spruce Budworm");
xlabel('Time')
ylabel('  Budworm, I  ')
plot(t2,y2(:,1),'linewidth',2);
legend(" Without harvesting", " With harvesting");
hold off

figure;
plot(t1,y1(:,2),'linewidth',2);
hold on
title("Stable Model of Spruce Budworm");
xlabel('Time')
ylabel('  Forest, F  ')
[t2, y2] = ode45(@rates6,tspan,y0);
plot(t2,y2(:,2),'linewidth',2);
legend(" Without harvesting", " With harvesting");
hold off

figure;
plot(t1,y1(:,3),'linewidth',2);
hold on
title("Stable Model of Spruce Budworm");
xlabel('Time')
ylabel('  Energy, E  ')
[t2, y2] = ode45(@rates6,tspan,y0);
plot(t2,y2(:,3),'linewidth',2);
legend(" Without harvesting", " With harvesting");
hold off

%% Functions

function dydt = rates5(~,y)     % ODEs without harvesting
 dydt = [(-3.2*y(1)*0+(1.52*y(1)*(1-(y(1)*(y(3)^2+0.75^2))/(335*y(2)*(y(3)^2))) - 43190 * (y(1)^2)/((1.11*y(2))^2 + y(1)^2)))  ;
           0.095* y(2)*(1-y(2)*1/(25440*y(3)));
          ((0.92*y(3)*(1-y(3)))-0.00195*(y(1)*(y(3)^2)/(y(2)*(y(3)^2)+0.75^2))) ];
end
function dydt = rates6(~,y)     % ODEs with harvesting
 dydt = [(-3.2*y(1)+(1.52*y(1)*(1-(y(1)*(y(3)^2+0.75^2))/(335*y(2)*(y(3)^2))) - 43190 * (y(1)^2)/((1.11*y(2))^2 + y(1)^2)))  ;
           0.095* y(2)*(1-y(2)*1/(25440*y(3)));
          ((0.92*y(3)*(1-y(3)))-0.00195*(y(1)*(y(3)^2)/(y(2)*(y(3)^2)+0.75^2))) ];
end
