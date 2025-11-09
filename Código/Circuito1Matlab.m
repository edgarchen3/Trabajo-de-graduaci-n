% Parámetros del circuito
R = 1000;      % Ohms
L = 0.1;       % Henrys
C = 10e-6;     % Faradios

% Matrices del sistema (fuente de voltaje ideal en paralelo con R,C,L)
% Estado: x = i_L
% Entrada: u = V(t)
% Salida (como en tu código): voltaje en el capacitor v_C = v = u
A = 0;        % [1x1]
B = 1/L;      % [1x1]
C_mat = 0;    % y = 0*x + 1*u  -> v_C = u
D = 1;        % salida depende directamente de la entrada

% Crear el sistema en espacio de estados
sys = ss(A, B, C_mat, D);

% Simular la respuesta al escalón
figure;
k = 5;          % Escalón de 5V
step(k*sys)
title('Voltaje en el capacitor (v_C) con entrada escalón de 5V');
xlabel('Tiempo (s)');
ylabel('Voltaje v_C(t) [V]');
grid on;
