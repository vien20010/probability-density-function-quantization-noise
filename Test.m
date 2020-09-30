syms t;
t=;
sig=sin(t);
partition = linspace(min(sig),max(sig),; % Ph�n ho?ch th�nh 12 kho?ng chia

codebook = [-1125:250:1125]; % B? m� l??ng t? g?m 12 m?c

[index,quants,distor]= quantiz(sig,partition,codebook);

plot(t,sig);

hold on;

stairs(t,quants); % ve tin hieu

quants %Cho hien thi tin hieu sau khi luong tu

distor % Cho hien thi nhieu luong tu