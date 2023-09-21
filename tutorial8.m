%3.23 a) 
s=tf('s'); 
kp=6.2; 
F=kp; 

G=0.2/((s^2+s+1)*(s+0.2)); 
figure(1); 
nyquist(F*G);
grid

%G input-output stable -> simplified nyquist critereon gives that system is
%stable for kp < 6.2 since point -1 is tp the left of the nyquist curve for
%kp < 6.2

%%
%3.23 b) 

clear; 

s=tf('s'); 
kp=1; 
ki = 1.44; 
F=kp + ki/s; 

G=0.2/((s^2+s+1)*(s+0.2)); 

figure(2); 
nyquist(F*G);
grid on 

%point -1 crossed at ki=1.44, which means k = 1.44 is border of stability,
%no rotations around -1 for ki < 1.44
%%
%2.23 c) 
clear; 

s=tf('s'); 
kp=1; 
ki = 1;
kd=66; 
T=0.1; 

F=kp + (ki/s) + (kd*s)/(s*T+1); 

G=0.2/((s^2+s+1)*(s+0.2)); 

figure(3); 
nyquist(F*G);
grid on 

%border of stability at kd=66 
%%
%4.5 
clear; 

s=tf('s'); 
Ga=1/(s^2+2*s+1);
%figure(4);
%%bode(Ga);
grid on
[Gm, Pm, Wc, Wp] = margin(Ga)
%figure(5); 
%step(feedback(Ga,1)); 
grid on

Gb=1/(s^2+0.4*s+1); 
figure(6); 
bode(Gb);
grid on; 
figure(7); 
step(feedback(Gb,1)); 
grid on

