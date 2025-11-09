% Parámetros del circuito
R  = 10000;      % Ohms (del circuito)
Rs = 100;      % Ohms (resistencia interna de la fuente)
L  = 0.01;       % Henrys
C  = 10e-6;     % Faradios

% Equivalente Norton de la fuente de 5 V
Req = 1/(1/R + 1/Rs);  % R en paralelo con Rs
In  = 5/Rs;            % Corriente del Norton

% Matrices del sistema (entrada = corriente In)
A = [-1/(Req*C),   -1;
      1/(L*C),      0 ];

B = [1;
     0];

C_mat = [1/C, 0];
D = 0;

% Crear el sistema y simular escalón de 5 V (vía Norton)
sys = ss(A, B, C_mat, D);
figure;
step(In*sys)
title(sprintf('v_C con fuente de 5 V y R_s = %g \\Omega (modelo Norton)', Rs));
xlabel('Tiempo (s)');
ylabel('Voltaje v_C(t) [V]');
grid on;
