syms t;
t=;
sig=sin(t);
partition = linspace(min(sig),max(sig),; % Q -1 khoang luong tu 

codebook = [-1125:250:1125]; % Q muc luong tu

[index,quants,distor]= quantiz(sig,partition,codebook);

plot(t,sig);

hold on;

stairs(t,quants); % ve tin hieu

quants %Cho hien thi tin hieu sau khi luong tu

distor % Cho hien thi nhieu luong tu