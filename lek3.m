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

step(Ga)
grid on


%visualize poles 
figure(3);
plot((pole(Ga)), 'x'); 

grid on

Gb = 1/(s^2+0.4*s+1); 
figure(2); 
step(Gb); 
pole(Gb)
figure(3); 
plot((real(pole(Gb)), imag(pole(Ga)), 'o'); 


Gc = 1/(s^2+5*s+1)
figure(2); 
step(Gc); 
pole(Gc); 
figure(3);
plot(pole(Gc), 'x');


Gd = 1/(s^2+s+1)
figure(2); 
step(Gd); 
pole(Gd)
figure(3); 
plot(pole(Gd),  'o'); 