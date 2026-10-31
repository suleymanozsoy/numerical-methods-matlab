m=68.1;

g=9.81;

c=12.5;

v_terminal = (m*g)/c;

dt = 0.5;

t = 0:dt:12;

v_exact=(v_terminal)*(1-exp(-c*t/m));

v = zeros(size(t));

for i=1:length(t)-1

    v(i+1)=v(i)+(g-(c*v(i)/m))*dt;



end

plot(t,v_exact);

hold on;

plot(t,v,'-o');

xlabel("Time(s)");

ylabel("Velocity(m/s)");

legend("Analytical","Euler");

title("Falling Parachutist");

hold off;




