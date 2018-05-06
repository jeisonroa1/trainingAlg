%% LMS 
%% Jeison Ivan Roa M. 2018
close all
clear all

%% Variacion de tasas
tasas = [0.1 0.01 0.001 1];
acumulado = [];
for i = 1:4
    alfa = tasas(i); % Tasa de aprendizaje
%% INICIALIZACION VARIABLES
x = [ 1, -1, -1; 1, -1, 1;1, 1, -1, ;1, 1, 1];
y = [-1,-1,-1,1];
p=1000; % Criterio de convergencia (Numero de iteraciones)
pcont=0; % Contador de convergencia
gradiente=0; % Gradiente
error=0;
errores=[];
%% Inicio algoritmo 
rng('shuffle');
w = rand(1,3);
w = w.'; %Traspuesta

while  pcont<p
    indice = randi([1 4]);
    %Paso 1
    error = (x(indice,:)*w)-y(indice);
    %Paso 2
    gradiente = (error*x(indice,:))';
    %Paso 3
    w = w - (gradiente*alfa);
    %Otros
    errores = [errores error];
    pcont=pcont+1;
end
acumulado = [acumulado; errores];

end
%% Figuras
xx = [1:1:p];
figure;
plot (xx,acumulado(1,:),'b');
hold on
plot (xx,acumulado(2,:),'g');
hold on
plot (xx,acumulado(3,:),'r');
set (gca,'fontsize',12); 
title ('Punto 1 (1000 Iteraciones)');
xlabel ('Iteracion');
ylabel ('Error');
legend('TA = 0.1','TA = 0.01','TA = 0.001')

xx = [1:1:p];
figure;
plot (xx,acumulado(4,:),'b');
set (gca,'fontsize',12); 
title ('Punto 1 (1000 Iteraciones) TA=1');
xlabel ('Iteracion');
ylabel ('Error');
legend('TA = 1')


