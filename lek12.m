%6.10 a) - see solution on paper

%b) 
s=tf('s'); 

G = 725/((s+1)*(s+2.5)*(s+25)); 
F1 = 1;
F2 = 0.46*((0.43*s+1)/(0.09*s+1))*((2*s+1)/(2*s)); 

%from exercise 5.13
figure(1); 
margin(F1*G);
grid on
% w_c = 5 rad/s

%relative error G_delta = -s/(s+1) and so IDG = 1/G_delta
IDG = 1/(-s/(s+1)); 

%T = (FG)/(1+FG) = complementary sensitivity function 
% for cases F1=1 and F2=controller
T1 =  feedback(F1*G,1); 
figure(2); 
bode(IDG, 'k-', T1, 'k-.'); 
title('bode plot for F1=1'); 
legend('G_delta', 'T');
grid on

T2 = feedback(F2*G,1); 
figure(3); 
bode(IDG, 'k-', T2, 'k-.'); 
title('bode plot for F2=controller'); 
legend('G_delta', 'T'); 
grid on

%answer: 

%bode plot for F1=1 shows that the relative model error G_delta is above
%the complementary sensitivity function T in the magnitude plot -> F1
%controlling the true system G_0 does not guarantee system to be
%asymtotically stable 

%bode plot for F2=controller shows that G_delta is under T in the magnitude
%plot -> system guaranteed to be asymptotically stable when F2 controlls
%the true system G_0

%%
%9.14 a) 
clear; 
s=tf('s'); 

G = 1/(s*(s+1)); 
%generate the state-space model from G using function ss 
G_state = ss(G)

%b) 

%place first set of poles {-2.2, -2.1} using the place function
 L1 = place(G_state.A, G_state.B, [-2.2, -2.1]); 
%closed-loop system transfer function given by A-BL in state-space
%description
G_o1 = ss(G_state.A-G_state.B*L1, G_state.B, G_state.C, 0); %D=0
%compute l_01=1
l_01 = 1/dcgain(G_o1); 
%transfer function of closed-loop system
Gc1 = G_o1*l_01;
% 
figure(1); 
%plot step response
[y,t,x] = step(Gc1, 10); 
u= l_01 -x*L1.'; 
plot(t,y,'-', t, u, '-.'); 
title('step response {-2.2, -2.1}'); 
legend('output y', 'control signal u');
grid on; 

%place second set of poles {-1+i, -1-i}
L2 = place(G_state.A, G_state.B, [-1+1i, -1-1i]); 
%compute l_01 = 1 using the formula for static gain 
l_02 = 1/(G_state.C * inv( -G_state.A + G_state.B*L2 ) * G_state.B );
%transfer function of closed-loop system
Gc2 = ss(G_state.A - G_state.B*L2, G_state.B*l_02, G_state.C,0); 

%plot step response 
figure(2); 
[y2, t2, x2] = step(Gc2, 10); 
u2= l_02 - x2 * L2.';
plot(t2, y2, '-', t2, u2, '-.'); 
title('step response {-1+i, -1-i}'); 
legend('output y', 'control signal u'); 
grid on

%answer:

%step response of {-2.2, -2.1} shows that input signal u initially must be 
% large = 4.5, but  step response of {-1+i, -1-i} shows that input signal u 
% initially can be smaller = 2 -> better to choose poles {-1+i, -1-i} to
% avoid physical limitations (rise time and settling time  similar in both
% cases and thus not interesting to compare) 
