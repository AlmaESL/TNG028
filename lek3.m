% 3.5 a) 
s = tf('s'); 
G = (0.2)/((s^2+s+1)*(s+0.2))

kp = 3; 
%%ki = 0.5; 

%1 to send y back as input -> closed loop system 
G2 = feedback(G*kp ,1);
step(G2); 
grid on; 

%%higer kp gives more oscillatory system. very high kp gives unstable
%%system 

%%
%3.5 b) 

s = tf('s'); 
GG = (0.2)/((s^2+s+1)*(s+0.2))

kpp = 1; 
ki = 0.5;

%1 to send y back as input -> closed loop system 
G3 = feedback(GG*(kpp+(ki*(1/s))),1);
step(G3); 
grid on; 

%higher ki goves more oscillations until unstable at very high ki close to
%2, with kp static at 1 

%%
%3.5 c) 

G4 = (0.2)/((s^2+s+1)*(s+0.2))


kpp = 1; 
kii = 1; 
T = 0.1; 
kd = 1.8;

F1 = kpp+(kii*(1/s)); 
F = ((kd*s)/((s*T)+1)); 

G5 = feedback(G4 * (F1+F),1);
step(G5); 
grid on; 

%higer kd dampens oscillations, slightly slower that with just pi control 
%too high kd gives unstable system 
%%
%2.6 a) 

s=tf('s'); 
Ga = 1/(s^2+2*s+1)
figure(2); 
step(Ga)
grid on

%visualize poles 
figure(3);
plot(real(pole(Ga)),imag(pole(Ga)), "xg");
title('poles') ;
xlabel('Re');
ylabel('Im'); 

grid on

%%
%2.6 b) 
s=tf('s'); 

Gb = 1/(s^2+0.4*s+1) 
figure(2); 
step(Gb); 
grid on
pole(Gb)
figure(3); 
plot(real(pole(Gb)),imag(pole(Gb)), "xr");

title('poles') ;
xlabel('Re');
ylabel('Im'); 

grid on 
%%
%2.6 c) 
s=tf('s');

Gc = 1/(s^2+5*s+1)
figure(2); 
step(Gc); 
grid on
pole(Gc); 
figure(3);
plot(real(pole(Gc)),imag(pole(Gc)), "xb"); 
title('poles') ;
xlabel('Re');
ylabel('Im'); 
grid on 

%%
%2.6 d)
s=tf('s'); 

Gd = 1/(s^2+s+1)
figure(2); 
step(Gd); 
grid on
pole(Gd)
figure(3); 
plot(real(pole(Gd)),imag(pole(Gd)), "xm");
title('poles') ;
xlabel('Re');
ylabel('Im'); 
grid on 
%%
%2.6 e) 
s=tf('s'); 

Ge = 4/(s^2+2*s+4)
figure(2); 
step(Ge);
grid on
pole(Ge)
figure(3); 
plot(real(pole(Ga)),imag(pole(Ga)), "xb"); 
title('poles');
xlabel('Re');
ylabel('Im'); 
grid on 
%%
%2.7

s=tf('s') ;
alpha = -0.2; 
G_s = (alpha*s+1)/(s^2+2*s+1); 
step(G_s); 
grid on; 

%%
%2.4 a) 
s=tf('s'); 

G_ref = 1/(s^2+s+1); 
figure(1); 
step(G_ref); 
title('reference step response'); 
grid on; 

G_A_pos = 1/(s^2+2*s+1); 
figure(2); 
step(G_A_pos); 
title('step response a > 1');
grid on; 

G_A_neg = 1/(s^2+0.5*s+1);
figure(3); 
step(G_A_neg); 
title('step response a < 1'); 
grid on; 

%we see that a < 1 gives the oscillations we need to match the solid line
%of the given plot that illustrates Ga

%%
%2.4 b) 
s=tf('s'); 
b=2; 
G_B = (b^2)/(s^2+b*s+(b^2))
step(G_B);
title('step response of Gb'); 
grid on

%genom att testa oss fram med olika värden på b så finner vi att b=2 ger
%det stegsvaret som visas i uppgiftens plot 