syms t
N=input('Nhap so mau can lay:');
Q=input('Nhap so muc luong tu:');
t=linspace(0,10,N);
x=sin(t)+cos(t);
a=max(x)-min(x);
delta=a/Q;
n=round(x/delta);
xq=delta*n;
eq=xq-x;
eq_square=eq.^2;
plot(t,x);
hold on
plot(t,xq);
E=sum(eq_square);
Peq=E/N