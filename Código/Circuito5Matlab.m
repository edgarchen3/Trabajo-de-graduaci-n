% Parámetros comerciales del circuito
R = 1e3;      % 1 kOhm
C = 1e-6;   % 1 μF

% Matrices del sistema en espacio de estados
% Variables de estado: x1 = Vc(t)
A = [0];

B = [1/(R*C)];

C_mat = [-1];  % Observamos el voltaje en el capacitor

D = 0;

% Crear el sistema en espacio de estados
sys = ss(A, B, C_mat, D);

% Simular la respuesta a una entrada escalón de voltaje
figure;
step(sys);
title('Respuesta del voltaje en el capacitor a entrada escalón de voltaje');
xlabel('Tiempo (s)');
ylabel('Voltaje v_C(t) [V]');
grid on;
