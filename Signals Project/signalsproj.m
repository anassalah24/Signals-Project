f1=500;
f2=1000;
f3=1500;
f4=2000;
fs= 10*max([f1,f2,f3,f4]);
ts=1/fs;
frmsize=2048;
t=(0:1:frmsize-1)*ts;
xt=cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t)+cos(2*pi*f4*t);
plot(t,xt);
audiowrite('xt.wav',xt,fs);
energy= sum(power(abs (xt),2))*ts
delta_f=fs/frmsize;
f=(-(frmsize/2):1:((frmsize/2)-1))*delta_f;
xf=fftshift(fft(xt,frmsize))/fs;
energy= sum(power(abs (xf),2))*(1/frmsize)
plot(f,abs(xf));
pkg load signal
fc = 1250/(fs/2);
[b,a] = butter (20,fc);
 y1 = filter (b,a,xt);
 y1f = fftshift(fft(y1));
 energy= sum(power(abs (y1),2))
 audiowrite('lowpass.wav',y1,fs);
 plot(f,abs(y1f)) 
 plot(t,abs(y1))
 freqz(b,a);
[d,c] = butter (20,fc,'high');
 y2 = filter (d,c,xt);
 y2f = fftshift(fft(y2));
 energy= sum(power(abs (y2),2))
 audiowrite('highpass.wav',y2,fs);
 plot(f,abs(y2f)) 
  plot(t,abs(y2))
 freqz(d,c);