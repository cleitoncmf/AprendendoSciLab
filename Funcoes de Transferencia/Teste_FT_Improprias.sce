// Scrip para testar o uso de funções de transferencia impróprias
// A ideia é torna-las próprias
clear // Deleta as todas as variáveis da memoria 
clc // Apaga as coisas escritas no console


// Definição do operador s de Laplace
s=poly(0,'s')




// Parcela para tornar própria uma FT imprópria
fc = 1e5
wc = 2* %pi * fc 
Gp =  wc/(s +wc) // Introduz um polo na frequência fc


// Indutância
L = 5e-3 
Z = L*s * Gp // Introduz um polo na frequência fc



// Definição de uma função de trasnferência a partir do polinômio
// O 'c' idica que estamos criando uma função de trasnferência contínua
Zs = syslin('c',Z)



// Diagrama de Bode de Zs
// plota o diagrama no range de 1Hz a 10*fc
bode(Zs,1,10*fc)
