% Parámetros comerciales del circuito
R = 100e3;        % 100 kOhm
C = 10e-6;        % 10 uF
Rf = 1e6;         % 1 MOhm (resistencia de fuga, >> R)

% Matrices del sistema en espacio de estados
A = -1/(Rf*C);
B = 1/(R*C);
C_mat = -1;      % Observamos el voltaje en el capacitor (salida es -x = v_o)
D = 0;

% Crear el sistema en espacio de estados
sys = ss(A, B, C_mat, D);

% Parámetros de la onda cuadrada
f = 2;          % frecuencia en Hz
T = 1/f;        % período
num_ciclos = 5; % cantidad de ciclos

% Vector de tiempo para la simulación
t = linspace(0, num_ciclos*T, 2000);

% Generación de entrada cuadrada (amplitud 1V de -1 a +1)
u = square(2*pi*f*t);

% Simular el sistema con la onda cuadrada
y = lsim(sys, u, t);

% Graficar
figure;
plot(t, y, 'LineWidth', 1.5); hold on;
plot(t, u, '--', 'LineWidth', 1); % Mostrar la entrada de referencia
title('Respuesta del sistema a una onda cuadrada');
xlabel('Tiempo (s)');
ylabel('Voltaje (V)');
legend('Salida v_o(t)', 'Entrada u(t)');
grid on;
