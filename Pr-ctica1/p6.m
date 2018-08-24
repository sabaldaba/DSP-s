clear all
close all
clc
Fs = 8e3;
recObj = audiorecorder(Fs,24,2);
disp('Start speaking.')
recordblocking(recObj, 5);
disp('End of Recording.');

play(recObj);

myRecording = getaudiodata(recObj);
%myRecording2=rescale(myRecording,-1,1);
redondeo = [-1:(1/15)*2:1]; %2e3
redondeo2 = [-1:(1/4096)*2:1]; %2e12
fourB = interp1(redondeo, redondeo, myRecording, 'nearest');
twelveB = interp1(redondeo2, redondeo2, myRecording, 'nearest');

subplot(4,2,[1,2]);
plot(myRecording);
hold on;
grid on
xlabel ('t');
ylabel  ('f(t)');
title ([ 'f(t) vs t']);

subplot(4,2,[3,4]);
plot(fourB);
hold on;
grid on;
xlabel ('t');
ylabel  ('f(t)');
title ([ '4 bits']);

subplot(4,2,[5,6]);
plot(twelveB);
hold on;
grid on;
xlabel ('t');
ylabel  ('f(t)');
title ([ '12 bits']);

subplot(4,2,7);
plot(myRecording-fourB);
hold on;
grid on;
xlabel ('t');
ylabel  ('f(t)');
title ([ 'Error 4 bits']);

subplot(4,2,8);
plot(myRecording-twelveB);
hold on;
grid on;
xlabel ('t');
ylabel  ('f(t)');
title ([ 'Error 12 bits']);

