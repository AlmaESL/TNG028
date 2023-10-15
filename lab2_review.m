s=tf('s'); 
kp = 100; 
G = 8/(s*((s/10)+1));
figure(1); 
bode(kp*G); 
grid on; 
figure(2); 
margin(G);
grid on
%%
clear; 
s=tf('s'); 
G=8/(s*((s/10)+1)); 
K = 3.06; 
tau_d = 0.096; 
tau_i = 0.46; 
gamma = 0.03; 
beta = 0.23; 
Flead = K*((tau_d*s + 1)/(tau_d*beta*s + 1)); 
Flag  = (tau_i*s+1)/(tau_i*s+gamma); 
F = Flead*Flag; 
figure(4); 
margin(G*F); 
grid on; 
figure(5); 
Gw=feedback(G,F);
step(Gw); 
grid on; 
%simulate system to check if M and Tr are fulfilled 
Gstep = feedback(G*F, 1);
figure(6); 
step(Gstep)
grid on; 