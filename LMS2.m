%% Algoritmo LMS
%% Jeison Ivan Roa M. 2018
close all
clear all
%% Variacion de tasas
tasas = [0.1 0.01 0.001 1];
acumulado = [];
for i = 1:4
    alfa = tasas(i); % Tasa de aprendizaje
%% Inicialización Variables
x = [ 1, 4, 3, 6; 1, 2, -2, 3;1, 1, 0, -3, ;1, 4, 2, 3];
y = [-1,1,1,-1];
p=8; % Criterio de convergencia (Numero de iteraciones)
pcont=0; % Contador de convergencia
gradiente=0; % Gradiente
error=0;
errores=[];
ext=6;
%% Inicio Algoritmo LMS
w = [1,0,0,0]; %Inicialización pesos.
w = w.'; % Traspuesta
while   pcont<p && ext<=4
    for indice = 1:4
        %Paso 1
        error = x(indice,:)*w-y(indice);
        if error ~= 0
            %Paso 2
            gradiente = (error*x(indice,:))';
            %Paso 3
            w = w - (gradiente*alfa);
        else
            ext = ext+1;
        end
        
        errores = [errores error];
        pcont = pcont+1;
    end 
end
acumulado = [acumulado; errores];
end

%% Figuras
xx = [1:1:p];
figure;
plot (xx,acumulado(3,:),'r');
hold on
plot (xx,acumulado(2,:),'b');
hold on
set (gca,'fontsize',12); 
title ('Punto 2 (1000 Iteraciones)');
xlabel ('Iteracion');
ylabel ('Error');
legend('TA = 0.001','TA = 0.01');

figure;
plot (xx,acumulado(1,:),'b');
set (gca,'fontsize',12); 
title ('Punto 2 (1000 Iteraciones) TA = 0.1 ');
xlabel ('Iteracion');
ylabel ('Error');
legend('TA = 0.1');

figure;
plot (xx,acumulado(4,:),'b');
set (gca,'fontsize',12); 
title ('Punto 2 (1000 Iteraciones) TA = 1');
xlabel ('Iteracion');
ylabel ('Error');
legend('TA = 1');




