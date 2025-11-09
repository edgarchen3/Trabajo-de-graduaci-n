% Parámetros del circuito
R1 = 1e3;     % 1 kΩ
R2 = 1e3;    % 10 kΩ
R3 = 1e3;    % 10 kΩ
C1 = 10e-6;    % 1 µF
C2 = 10e-6;  % 0.1 µF

% Matrices según análisis correcto
A = [-(1/R1 + 1/R2)/C1,   -1/(R2*C1);
     -1/(R2*C2),         -(1/R3 + 1/R2)/C2];

B = [(1/R1 + 1/R2)/C1;
      1/(R2*C2)];

C_mat = [0 1];
D = 0;

% Crear sistema en espacio de estados
sys = ss(A, B, C_mat, D);

% Entrada escalón de 5 V
u_amp = 5;
figure;
step(u_amp * sys);
title('Voltaje en C2 con escalón de 5 V de entrada (modelo correcto)');
xlabel('Tiempo (s)');
ylabel('v_{C2}(t) [V]');
grid on;
