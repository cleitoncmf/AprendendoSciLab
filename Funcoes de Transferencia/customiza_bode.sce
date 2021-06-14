// Script para criar diagramas de bode customizados
clear
clc


// Definição do operador s de Laplace
s=poly(0,'s')


// Definição de um polinômico
P = 100/(s +100)
Ps = syslin('c',P)

