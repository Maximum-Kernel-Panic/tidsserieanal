[y, Fs] = audioread('fa.wav');
h = 1/Fs;
t = linspace(0,length(y),length(y));
% plot(t',y);

N_sel = 200;
y_sel = y(2801:3000);
plot(y_sel);
estAcf = acf(y,50);
t_acf = linspace(0,51*h,51);
figure(1);
plot(t_acf,estAcf);

Nz = 9;
totsize = 2^Nz;
% pad_size = totsize-length(y_sel);
% zeros_add = zeros(pad_size,1);
% y_sel_padded = [y_sel;zeros_add];
Fy = fft(estAcf,totsize);
P2 = abs(Fy/totsize);
P1 = P2(1:totsize/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(totsize/2))/totsize;
figure(2);
plot(f,P1);