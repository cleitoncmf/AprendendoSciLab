// Script para criar as impedãncias
clear
clc



// Definição do operador s de Laplace
s=poly(0,'s')




// Definição de um polinômico
zp = 100*s/(s +1000);
yp = 10*s/(s +1000);

zpteste = s^2+10*s+5;


// Conversão para Laplace
zs = syslin('c',zp)
ys = syslin('c',yp)


// Definição dos elementos de Z
Z11 = zs
Z12 = zs
Z13 = zs
Z14 = zs
Z15 = zs
Z16 = zs

Z21 = zs
Z22 = zs
Z23 = zs
Z24 = zs
Z25 = zs
Z26 = zs

Z31 = zs
Z32 = zs
Z33 = zs
Z34 = zs
Z35 = zs
Z36 = zs

Z41 = zs
Z42 = zs
Z43 = zs
Z44 = zs
Z45 = zs
Z46 = zs

Z51 = zs
Z52 = zs
Z53 = zs
Z54 = zs
Z55 = zs
Z56 = zs

Z61 = zs
Z62 = zs
Z63 = zs
Z64 = zs
Z65 = zs
Z66 = zs


teste = 32;




