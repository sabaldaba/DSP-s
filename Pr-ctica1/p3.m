clear all
close all
clc

Fs = 5;
Ts = 1/Fs;
Fs2 = 100;
Ts2= 1/Fs2;
t = -1:Ts:1;
t2 = -1:Ts2:1;
n_max=50;

x = sin(15*pi*t) + cos(20*pi*t);

subplot(2,1,1);
stem(t, x);
hold on;
fx = 0;

for n = 1 : numel(t)
    fx = fx + (x(n)*sinc((t2+1.02-((n)*Ts))/Ts));
end
plot(t2,fx);
hold on;

Fs = 50;
Ts = 1/Fs;
Fs2 = 5000;
Ts2= 1/Fs2;
t = -1:Ts:1;
t2 = -1:Ts2:1;
n_max=50;

x = sin(15*pi*t) + cos(20*pi*t);

subplot(2,1,2);
x = sin(15*pi*t) + cos(20*pi*t);
stem(t, x);
hold on;

fx = 0; 

for n = 1 : numel(t)
    fx = fx + (x(n)*sinc((t2+1.02-((n)*Ts))/Ts));
end

plot(t2,fx);
hold on;
