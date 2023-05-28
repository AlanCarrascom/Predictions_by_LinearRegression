%%%%%%%%%%%%%%%%%%%%
% Alan Carrasco
% Jonathan García
% 28 de mayo de 2023
%%%%%%%%%%%%%%%%%%%%

% REGRESIÓN MULTIVARIABLE
clc
datos = readmatrix("Admission_Predict.csv"); % se extraen los datos del csv en la variable 'datos'
n = length(datos); % tamaño de nuestro vector de datos

% declaración de las sumatorias que se utilizarán para la regresión lineal
% x1=GRE; x2=TOEFL; x3=SchoolRating; x4=SOP; x5=LOR; x6=CGPA; x7=Research;
% y=Chance
sum_x1 = 0;
sum_x2 = 0;
sum_x3= 0;
sum_x4 = 0;
sum_x5 = 0;
sum_x6= 0;
sum_x7= 0;
sum_y = 0;

% combinaciones con las demás variables
% para x1
sum_x1x1 = 0;
sum_x1x2 = 0;
sum_x1x3 = 0;
sum_x1x4 = 0;
sum_x1x5 = 0;
sum_x1x6 = 0;
sum_x1x7 = 0;
sum_x1y = 0;

% para x2
% sum_x2x1 = 0;
sum_x2x2 = 0;
sum_x2x3 = 0;
sum_x2x4 = 0;
sum_x2x5 = 0;
sum_x2x6 = 0;
sum_x2x7 = 0;
sum_x2y = 0;

% para x3
% sum_x3x1 = 0;
% sum_x3x2 = 0;
sum_x3x3 = 0;
sum_x3x4 = 0;
sum_x3x5 = 0;
sum_x3x6 = 0;
sum_x3x7 = 0;
sum_x3y = 0;

% para x4
% sum_x4x1 = 0;
% sum_x4x2 = 0;
% sum_x4x3 = 0;
sum_x4x4 = 0;
sum_x4x5 = 0;
sum_x4x6 = 0;
sum_x4x7 = 0;
sum_x4y = 0;

% para x5
% sum_x5x1 = 0;
% sum_x5x2 = 0;
% sum_x5x3 = 0;
% sum_x5x4 = 0;
sum_x5x5 = 0;
sum_x5x6 = 0;
sum_x5x7 = 0;
sum_x5y = 0;

% para x6
% sum_x6x1 = 0;
% sum_x6x2 = 0;
% sum_x6x3 = 0;
% sum_x6x4 = 0;
% sum_x6x5 = 0;
sum_x6x6 = 0;
sum_x6x7 = 0;
sum_x6y = 0;

% para x7
% sum_x7x1 = 0;
% sum_x7x2 = 0;
% sum_x7x3 = 0;
% sum_x7x4 = 0;
% sum_x7x5 = 0;
% sum_x7x6 = 0;
sum_x7x7 = 0;
sum_x7y = 0;
% Las variables que están comentadas son aquellas que se son equivalentes a
% variables que ya se definieron anteriormente, por ejemplo x1*x2 = x2*x1

% calculo de sumatorias
% i = 2:n porque i=1 son los títulos
for i = 2:n
    % para x1 y sus combinaciones
    sum_x1 = datos(i,2) + sum_x1;
    sum_x1x1 = datos(i,2) * datos(i,2) + sum_x1x1;
    sum_x1x2 = datos(i,2) * datos(i,3) + sum_x1x2;
    sum_x1x3 = datos(i,2) * datos(i,4) + sum_x1x3;
    sum_x1x4 = datos(i,2) * datos(i,5) + sum_x1x4;
    sum_x1x5 = datos(i,2) * datos(i,6) + sum_x1x5;
    sum_x1x6 = datos(i,2) * datos(i,7) + sum_x1x6;
    sum_x1x7 = datos(i,2) * datos(i,8) + sum_x1x7;
    sum_x1y = datos(i,2) * datos(i,9) + sum_x1y;
    
    % para x2 y sus combinaciones
    sum_x2 = datos(i,3) + sum_x2;
    sum_x2x2 = datos(i,3) * datos(i,3) + sum_x2x2;
    sum_x2x3 = datos(i,3) * datos(i,4) + sum_x2x3;
    sum_x2x4 = datos(i,3) * datos(i,5) + sum_x2x4;
    sum_x2x5 = datos(i,3) * datos(i,6) + sum_x2x5;
    sum_x2x6 = datos(i,3) * datos(i,7) + sum_x2x6;
    sum_x2x7 = datos(i,3) * datos(i,8) + sum_x2x7;
    sum_x2y = datos(i,3) * datos(i,9) + sum_x2y;

    % para x3 y sus combinaciones
    sum_x3 = datos(i,4) + sum_x3;
    sum_x3x3 = datos(i,4) * datos(i,4) + sum_x3x3;
    sum_x3x4 = datos(i,4) * datos(i,5) + sum_x3x4;
    sum_x3x5 = datos(i,4) * datos(i,6) + sum_x3x5;
    sum_x3x6 = datos(i,4) * datos(i,7) + sum_x3x6;
    sum_x3x7 = datos(i,4) * datos(i,8) + sum_x3x7;
    sum_x3y = datos(i,4) * datos(i,9) + sum_x3y;

    % para x4 y sus combinaciones
    sum_x4 = datos(i,5) + sum_x4;
    sum_x4x4 = datos(i,5) * datos(i,5) + sum_x4x4;
    sum_x4x5 = datos(i,5) * datos(i,6) + sum_x4x5;
    sum_x4x6 = datos(i,5) * datos(i,7) + sum_x4x6;
    sum_x4x7 = datos(i,5) * datos(i,8) + sum_x4x7;
    sum_x4y = datos(i,5) * datos(i,9) + sum_x4y;

    % para x5 y sus combinaciones
    sum_x5 = datos(i,6) + sum_x5;
    sum_x5x5 = datos(i,6) * datos(i,6) + sum_x5x5;
    sum_x5x6 = datos(i,6) * datos(i,7) + sum_x5x6;
    sum_x5x7 = datos(i,6) * datos(i,8) + sum_x5x7;
    sum_x5y = datos(i,6) * datos(i,9) + sum_x5y;

    % para x6 y sus combinaciones
    sum_x6 = datos(i,7) + sum_x6;
    sum_x6x6 = datos(i,7) * datos(i,7) + sum_x6x6;
    sum_x6x7 = datos(i,7) * datos(i,8) + sum_x6x7;
    sum_x6y = datos(i,7) * datos(i,9) + sum_x6y;

    % para x7 y sus combinaciones
    sum_x7 = datos(i,8) + sum_x7;
    sum_x7x7 = datos(i,8) * datos(i,8) + sum_x7x7;
    sum_x7y = datos(i,8) * datos(i,9) + sum_x7y;

    % para y
    sum_y = datos(i,9) + sum_y;
end

% generación de matriz de coeficientes A
A = [sum_x1 sum_x2 sum_x3 sum_x4 sum_x5 sum_x6 sum_x7 n;
     sum_x1x1 sum_x1x2 sum_x1x3 sum_x1x4 sum_x1x5 sum_x1x6 sum_x1x7 sum_x1;
     sum_x1x2 sum_x2x2 sum_x2x3 sum_x2x4 sum_x2x5 sum_x2x6 sum_x2x7 sum_x2;
     sum_x1x3 sum_x2x3 sum_x3x3 sum_x3x4 sum_x3x5 sum_x3x6 sum_x3x7 sum_x3;
     sum_x1x4 sum_x2x4 sum_x3x4 sum_x4x4 sum_x4x5 sum_x4x6 sum_x4x7 sum_x4;
     sum_x1x5 sum_x2x5 sum_x3x5 sum_x4x5 sum_x5x5 sum_x5x6 sum_x5x7 sum_x5;
     sum_x1x6 sum_x2x6 sum_x3x6 sum_x4x6 sum_x5x6 sum_x6x6 sum_x6x7 sum_x6;
     sum_x1x7 sum_x2x7 sum_x3x7 sum_x4x7 sum_x5x7 sum_x6x7 sum_x7x7 sum_x7];

% generación de matriz de términos independientes B
B = [sum_y; sum_x1y; sum_x2y; sum_x3y; sum_x4y; sum_x5y; sum_x6y; sum_x7y];

% obtención del vector de incógnitas x
x = A\B; % notación de matlab para inv(A)*B
a1=x(1,1); a2=x(2,1); a3=x(3,1); a4=x(4,1); a5=x(5,1); a6=x(6,1); a7=x(7,1); a8=x(8,1);
x1 = input("Ingresa tu GRE (0-340):");
x2 = input("Ingresa tu puntuación TOEFL (0-120):");
x3 = input("Ingresa tu calificación universitaria (0-5):");
x4 = input("Ingresa tu SOP (0-5):");
x5 = input("Ingresa tu LOR (0-5):");
x6 = input("Ingresa tu GPA (0-10):");
x7 = input("Ingresa tu experiencia en investigación (0-1):");
y = a1*x1 + a2*x2 + a3*x3 + a4*x4 +a5*x5 + a6*x6 + a7*x7 +a8;
fprintf("Tu posibilidad de ingreso a la maestría es %.2f\n",y);