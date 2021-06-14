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
Mag_num_Z1_ctg = 20*log10(abs(Z1_ctg));
Phi_num_Z1_ctg = (180/%pi)*atan(imag(Z1_ctg),real(Z1_ctg))


// Obtenção de uma função de transferência aproximada
FT_5 = frep2tf(f,Z1_ctg,2) // FT com grau 5


// Diagrama de Bode
fmin = 1e-1; // Menor frequência do bode
fmax = 1e5; // Maior frequência do bode

// Plota o diagrama de bode
bode([FT_5],fmin,fmax)

// Obtem um links para os gráficos de magnitude e fase
bode_link=get("current_figure") 
bode_link_parts=bode_link.children
bode_mag = bode_link_parts(2) 
bode_phi = bode_link_parts(1)

// Plota os dados originais nos lugares certos
plot(bode_mag,f,Mag_num_Z1_ctg,'r')
plot(bode_phi,f,Phi_num_Z1_ctg,'r')
legend(['FT_2';'Original'])

// Configura o nome dos eixos e o tamanho da fonte
xlabel(bode_mag,'Frequência - Hz','font_size',4)
xlabel(bode_phi,'Frequência - Hz','font_size',4)

ylabel(bode_mag,'Magnitude - dB','font_size',4)
ylabel(bode_phi,'Fase - Graus','font_size',4)

// Altera a funte das escalas
bode_mag.font_size = 4
bode_phi.font_size = 4


