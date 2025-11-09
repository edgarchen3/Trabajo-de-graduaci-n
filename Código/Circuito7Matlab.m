% Parámetros comerciales del circuito
Rs = 100e3;  
R2 = 1e3;  
R3 = 1e3;  
R4 = 1e3; 
L  = 10e-3;
C1 = 10e-6; 
C2 = 10e-6; 
C3 = 10e-6;

% === Equivalentes útiles del nodo b (solo R2 y R3 cuelgan de b) ===
alpha = (R2*R3)/(R2+R3);      % R_eq = R2||R3
beta  = (R3)/(R2+R3);         % factor de reparto hacia C1

% ================= Matrices del sistema ============================
% Estados: x = [ i_L ; v_C1 ; v_C2 ; v_C3 ], entrada u = V(t)
A = [ -alpha/L,                      -beta/L,                 0,                   0;
       R3/(C1*(R2+R3)),  -1/(C1*(R2+R3)),                 0,                   0;
       0,                               0,        -1/(R4*C2),                   0;
       0,                               0,                 0,        -1/(Rs*C3) ];

B = [ 1/L;
      0;
      1/(R4*C2);
      1/(Rs*C3) ];

C_mat = [0 0 0 1];   % y = v_C3
D = 0;

% Crear el sistema en espacio de estados
sys = ss(A,B,C_mat,D);

% Ejemplo: pulso 0–5 V, T=2 s (50% duty)
t = 0:1e-3:10;
u = 2.5*(square(2*pi*(1/2)*t,50)+1);  % 0..5 V
[y,~,x] = lsim(sys,u,t,[0 0 0 0]);

figure; plot(t,u,t,y); grid on;
legend('u(t)','v_{C3}(t)','Location','best');
title('Respuesta con modelo (Rs→C3 desde bus izquierdo, medición en +C_3)');
xlabel('Tiempo (s)'); ylabel('V');

% Polos (sanity check)
disp('Polos del sistema:'), disp(pole(sys))
