%% Algoritmo del perceptrón
%% Jeison Roa 2018

clear all
close all
%% INICIALIZACION VARIABLES

x = [ 1, 4, 3, 6; 1, 2, -2, 3;1, 1, 0, -3, ;1, 4, 2, 3];
y = [-1,1,1,-1];
iteraciones =10;
iteracion=0;
pesositeracion = zeros(iteraciones,5); %3 es el numero de parametros a hallar.

p=4; %criterio de convergencia
%% Inicio ciclo de iteraciones
for iteracion = 1:iteraciones

rng('shuffle');

pcont=0; % Reinicia contador de convergencia
gradiente=0; % Reinicia gradiente
error=0;
correccion = 0;
indice = 1;
tabla = zeros()

w = [1,0,0,0];
w = w.'; %Traspuesta
%% Inicio algoritmo 


while  pcont<p
    for indice = 1:4
    %Paso 1
    salida = sign(x(indice,:)*w);
    error = x(indice,:)*w*y(indice);
    %Paso 2
    if error<=0
        gradiente = (x(indice,:)*y(indice)).';%% CORREGIR
        w = w + gradiente;
        correccion=correccion+1;
        pcont=0;
    else %Paso 3
        pcont=pcont+1;
    end
    end    
end

pesositeracion (iteracion, 1:4) = w.';
pesositeracion (iteracion, 5) = correccion;
end










