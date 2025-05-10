clc; clear; close all;

syms theta1 theta2 theta3 theta4 theta5 theta6

% Longueurs en cm
L1 = 3;
L2 = 25;
L3 = 117.3;
L6= 6;

% Paramètres DH : [theta d a alpha]
DH = [...
    theta1   0    0    pi/2;
    theta2   L1    0  -pi/2;
    theta3   0   L2     0;
    theta4   0    0   -pi/2;
    theta5   0    0    pi/2;
    theta6   L6    0     0];

% Fonction pour créer la matrice DH
dh_transform = @(theta, d, a, alpha) [...
    cos(theta), -sin(theta)*cos(alpha),  sin(theta)*sin(alpha), a*cos(theta);
    sin(theta),  cos(theta)*cos(alpha), -cos(theta)*sin(alpha), a*sin(theta);
    0,           sin(alpha),             cos(alpha),             d;
    0,           0,                      0,                      1];

% Calcul des matrices de transformation
T = eye(4);
for i = 1:size(DH,1)
    T_i = dh_transform(DH(i,1), DH(i,2), DH(i,3), DH(i,4));
    T = simplify(T * T_i);
end

disp('Transformation homogène totale T_0^6 :')
pretty(T)
