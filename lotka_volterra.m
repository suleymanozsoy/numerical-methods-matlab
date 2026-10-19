clear;
clc;
close all;
h=0.01;
t=0:h:40;
x0=1.1;
y0=1;
x = zeros(size(t));
y = zeros(size(t));
x(1) = x0;
y(1) = y0;
for i = 1:length(t)-1
    x(i+1) = x(i) + h * x(i)*(1-y(i));
    y(i+1) = y(i) + h * y(i)*(x(i)-1);
end
figure;
plot(t,x,'b-');
hold on;
plot(t,y,'r');
xlabel('Time');
ylabel('Population');
legend('Prey','Predator');
title(sprintf('Euler Method: x0=%.1f, y0=%.1f',x0,y0));
grid on;
exportgraphics(gcf,sprintf('Euler_x%.1f_y%.1f.png',x0,y0));
figure;
subplot(2,2,1);
plot(t,x,'b');
hold on;
plot(t,y,'r');
title('Experiment 1');
legend('Prey','Predator');
grid on;
IC =[
2 1;
4 1;
4 0.2
];
for k=1:3

    x=zeros(size(t));
    y=zeros(size(t));
    x(1)=IC(k,1);
    y(1)=IC(k,2);

    for i = 1:length(t)-1

        x(i+1)=x(i)+h*x(i)*(1-y(i));
        y(i+1) = y(i) + h*y(i)*(x(i)-1);

    end

    subplot(2,2,k+1);
    plot(t,x,'b');
    hold on;
    plot(t,y,'r');
    title(['Experiment',num2str(k+1)]);
    xlabel('Time');
    ylabel('Population');
    legend('Prey','Predator');
    grid on;

end

exportgraphics(gcf,'Euler_Results.pdf');

%RUNGE KUTTA 4

f= @(x,y) x*(1-y);
g= @(x,y) y*(x-1);
xr= zeros(size(t));
yr=zeros(size(t));
xr(1)=1.1;
yr(1)=1;

for i = 1:length(t)-1

a=xr(i);
b=yr(i);

k1x=f(a,b);
k1y=g(a,b);

k2x=f(a+h*k1x/2, b+h*k1y/2);
k2y=g(a+h*k1x/2, b+h*k1y/2);

k3x= f(a+h*k2x/2, b+h*k2y/2);
k3y= g(a+h*k2x/2, b+h*k2y/2);

k4x= f(a+h*k3x, b+h*k3y);
k4y= g(a+h*k3x, b+h*k3y);

xr(i+1)= a+h*(k1x+2*k2x+2*k3x+k4x)/6;
yr(i+1)= b+h*(k1y+2*k2y+2*k3y+k4y)/6;

end


xrAll = zeros(length(t),4);
yrAll = zeros(length(t),4);

xrAll(:,1) = xr;
yrAll(:,1) = yr;


figure;

plot(t,xr,'b','LineWidth',1.5);
hold on;
plot(t,yr,'r','LineWidth',1.5);

xlabel('Time');
ylabel('Population');
title('RK4 - Experiment 1');
legend('Prey','Predator');
grid on;

figure;
subplot(2,2,1);

plot(t,xr,'b');
hold on;
plot(t,yr,'r');

title('RK4 - Experiment 1');
xlabel('Time');
ylabel('Population');
legend('Prey','Predator');
grid on;

IC_RK4 = [
2  1;
4  1;
4  0.2];

for k = 1:3

    xr = zeros(size(t));
    yr = zeros(size(t));

    xr(1) = IC_RK4(k,1);
    yr(1) = IC_RK4(k,2);

    for i = 1:length(t)-1

        a=xr(i);
        b=yr(i);

        k1x=f(a,b);
        k1y=g(a,b);

        k2x=f(a+h*k1x/2,b+h*k1y/2);
        k2y=g(a+h*k1x/2,b+h*k1y/2);
    
        k3x=f(a+h*k2x/2,b+h*k2y/2);
        k3y=g(a+h*k2x/2,b+h*k2y/2);

        k4x=f(a+h*k3x,b+h*k3y);
        k4y=g(a+h*k3x,b+h*k3y);

        xr(i+1)=a+h*(k1x+2*k2x+2*k3x+k4x)/6;
        yr(i+1)=b+h*(k1y+2*k2y+2*k3y+k4y)/6;

    end


    xrAll(:,k+1) = xr;
    yrAll(:,k+1) = yr;


    subplot(2,2,k+1);

    plot(t,xr,'b');
    hold on;
    plot(t,yr,'r');

    title(['RK4 _ Experiment ',num2str(k+1)]);
    xlabel('Time');
    ylabel('Population');
    legend('Prey','Predator');
    grid on;

end

exportgraphics(gcf,'RK4_Results.pdf');

figure;

plot(xrAll,yrAll,'LineWidth',1.5);
hold on;

plot(1,1,'ko','MarkerFaceColor','k');

xlabel('Prey Population (x)');
ylabel('Predator Population (y)');
title('Lotka-Volterra Phase Portrait - RK4');

legend('IC (1.1,1)','IC (2,1)','IC(4,1)','IC(4,0.2)','Equilibrium(1,1)');

axis equal;
grid on;

exportgraphics(gcf,'Phase_Portrait.pdf');

file = 'Suleyman_Ozsoy_150124022.pdf';

exportgraphics(figure(2),file,'ContentType','vector');

exportgraphics(figure(4),file,'ContentType','vector','Append',true);

exportgraphics(figure(5),file,'ContentType','vector','Append',true);
