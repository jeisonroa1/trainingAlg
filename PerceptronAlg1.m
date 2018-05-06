% Algoritmo del perceptrón
% Jeison Roa 2018

close all
clear all



%% INICIALIZACION VARIABLES

x = [ 1, -1, -1; 1, -1, 1;1, 1, -1, ;1, 1, 1];
y = [-1,-1,-1,1];
iteraciones =16;
pesositeracion = zeros(iteraciones,4); %3 es el numero de parametros a hallar.

p=10; %criterio de convergencia
%% Inicio ciclo de iteraciones

for iteracion = 1:iteraciones
    
rng('shuffle');

pcont=0; % Reinicia contador de convergencia
gradiente=0; % Reinicia gradiente
error=0;
correccion = 0;

w = rand(1,3);
for cont = 1:3
    if w(cont)>0.5 
        w(cont)=1;
    else
        w(cont)=-1;
    end
end
w = w.'; %Traspuesta
%% Inicio algoritmo 

while  pcont<p
    %Paso 1
    indice = randi([1 4]);
    error = x(indice,:)*w*y(indice);
    %Paso 2
    if error<=0
        gradiente = (y(indice)*x(indice,:)).';
        w = w + gradiente;
        correccion=correccion+1;
        pcont=0;
    else %Paso 3
        
    end
    pcont=pcont+1;
end
pesositeracion (iteracion, 1:3) = w.';
pesositeracion (iteracion, 4) = correccion;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% GRÁFICAS - Espacio de entrada salida
puntosBOLAX = [-1 -1  1]     %Coordenadas ceros
puntosBOLAY = [-1  1  -1]
puntosCRUZX = [1]            %Coordenadas cruces
puntosCRUZY = [1]
hold on;
plot(puntosBOLAX, puntosBOLAY, 'og', 'MarkerFaceColor', 'g');
plot(puntosCRUZX, puntosCRUZY, 'x' , 'MarkerFaceColor', 'b');
xlabel('X');
ylabel('Y');
title('Espacio de Entrada-Salida')
axis([-2 2 -2 2]);
plot([1 -1],[-1 1]); % Recta seleccionada
hold off;
                  %Matriz de 1 y 0
PBOLAS = [puntosBOLAX, puntosBOLAY]; % Ceros
PCRUZ  = [puntosCRUZX, puntosCRUZY]; % Unos
%% Gráfica de la recta arbitraría elegida
figure(2)
hold on
plot([1 -1],[-1 1])
title(['Discriminante lineal elegido'])
xlabel('X');
ylabel('Y');
axis([-2 2 -2 2]);
hold off;



