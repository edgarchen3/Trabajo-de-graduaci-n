% Parámetros comerciales del circuito
R1 = 1e3;    % 1 kΩ
R2 = 1e3;   % 10 kΩ
R3 = 10e3;   % 10 kΩ

c1 = 1e-6;   % 1 μF
c2 = 0.1e-6; % 0.1 μF
c3 = 10e-6;  % 10 μF

% Matrices del sistema en espacio de estados
% Variables de estado: x1 = i(t), x2 = v_C(t)
A = [
    -(R1 + R2) / (R1 * R2 * c1),   1 / (R2 * c1),      -1 / (R2 * c1);
     0,                            0,                  -1 / (R3 * c2);
    -1 / (R2 * c3),                1 / (R2 * c3), -(R2 + R3) / (R2 * R3 * c3)
];

B = [1 / (R1 * c1); 0; 0];

C_mat = [0, 1, 0];

D = 0;

% Crear el sistema en espacio de estados
sys = ss(A, B, C_mat, D);

% Escalar el sistema para un escalón de 5 V
u_amp = 5;
sys5 = u_amp * sys;

% Simular la respuesta a la entrada escalón de 5 V
figure;
step(sys5);
title('Voltaje en C2 con escalón de 5 V de entrada');
xlabel('Tiempo (s)');
ylabel('Voltaje [V]');
grid on;
