syms t
%N samples
N=input('Input The number of samples:');

%Examining time
T=input('Input Examining time of the signal:');

%Possilble value
Q=input('Input The number of possilble value:');

t=linspace(0,T,N);

%Random Signal to estimate quantization error
Signal=300*sin(t)+200*cos(t).^2+400*cos(3*t);
%Signal=1000*sin(t);

%Quantization step size
Delta=(max(Signal)-min(Signal))/Q;

Shift = (max(Signal)+min(Signal))/2 + Delta/2;
Shift_Signal=Signal - Shift;

%Quantization step
Step=round(Shift_Signal/Delta);
%Because there are only Q possilble values
%We must increase(decrease) min(max) Quantization step 1 unit
%{
Step_min=min(Step);
for i=1:N
    if Step(i)==Step_min
        Step(i)=Step(i)+1;
    end
end
%}
Quantized_Signal=Delta*Step+Shift;

plot(t,Signal);
hold on
plot(t,Quantized_Signal);
axis([0 2*pi -1000 1000]);
hold off

%Quantization error
Error_Quan = Quantized_Signal - Signal;
Error_Quan_Square = Error_Quan.^2;

%Estimate energy of Quatization error
E_eq=sum(Error_Quan_Square);

%Estimate actual power of Quantization error N samples
P_eq=E_eq/N;
fprintf('Actual power of quantization error: %f \n',P_eq);

%Calculate theoretical power of Quantization error (formula Delta^2/12)
fprintf('Theoretical power of quatization error: %f \n',Delta^2/12);

%The Differential between actuality and theory
Dif_Power = abs(P_eq-Delta^2/12)*100/(Delta^2/12);
fprintf('The Differential between actuality and theory: %f %% \n',Dif_Power);
