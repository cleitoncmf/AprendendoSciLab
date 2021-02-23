//
clear
clc


// Complex number
j = complex(0,1)


// Dados genéricos para testar a abordagem
r1 = 10
r0 = 5

// Vetor de frequ~encia
f = 1:1:1e3
w = 2 * %pi * f

// Mais dados genéricos para testar a abordagem
mu_0 = 4 * %pi * 1e-7
mu_c = 100
ro_c = 10

// definido da pg 26, depois da eq (3.13) da Tese do Paulo
eta_c = sqrt(j*w*mu_0*mu_c/ro_c)


// cotangente da eq 3.14
// Esta é uma resposta em frequência numérica
Z1_ctg = coth(eta_c*(r1-r0))

// criação do bode numérico
Mag_num_Z1_ctg = 20*log10(abs(Z1_ctg))


// Obtenção de uma função de transferência aproximada
FT_5 = frep2tf(f,Z1_ctg,5) // FT com grau 5
FT_10 = frep2tf(f,Z1_ctg,10) // FT com grau 5



// Diagrama de Bode
bode([FT_5;FT_10],1,1e3)
plot(f,Mag_num_Z1_ctg,'r')
legend(['FT_5';'FT_10';'Original'])
