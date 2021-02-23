// Scrip para testar o uso de funções de transferencia e produzir alguns plots
clear // Deleta as todas as variáveis da memoria 
clc // Apaga as coisas escritas no console


// Definição do operador s de Laplace
s=poly(0,'s')



// Definição de um polinômico
P = 100/(s +100)


// Definição de uma função de trasnferência a partir do polinômio
// O 'c' idica que estamos criando uma função de trasnferência contínua
Ps = syslin('c',P)



// Diagrama de Bode de Ps
bode(Ps)



// Resposta do sistema a uma senoide
// %pi representa o PI
t=0:1e-5:0.1; // Vetor de tempo
u = sin(2*%pi*60*t) // Sinal senoidal

y = csim(u,t,Ps) // Saída do sistema

figure // cria uma nova figura: para não plotar sebre o diagrama de Bode
plot(t,u,t,y) // plot da entrada e da saída do sistema
legend(['Entrada: u';'Saída: y']);


// Resposta do sistema a um degrau
y_step = csim('step',t,Ps) 
figure // cria uma nova figura: para não plotar sebre o diagrama de Bode
plot(t,y_step) // plot da saída do sistema

