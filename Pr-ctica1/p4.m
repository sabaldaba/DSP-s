%%
Fs=250;
Ts=1/Fs;
t=-1:.001:1;

%t=0:.001:20*Ts;
sig=0.3*sin(100*pi*t);
maxsig=max(sig); %signal max
interv=2*maxsig/(2^3-1); %interval length for 8 levels resolution
u=maxsig+interv;
partition = [-maxsig:interv:maxsig]; 
codebook = [-maxsig:interv:u]; 
[index,quants] = quantiz(sig,partition,codebook); % Quantize.
plot(t,sig,'-',t,quants,'-');
hold on;
plot(t,(quants-sig));
legend('Original signal','Quantized signal','Error');

