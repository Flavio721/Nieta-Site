// Primeiro desenha o personagem normalmente
draw_self();

// Desenhar a barra de HP acima do personagem
var largura_barra = 50;
var altura_barra = 6;

var porcentagem = vida / vida_max;
var barra_cheia = largura_barra * porcentagem;

draw_set_color(c_red);
draw_rectangle(x - largura_barra/2, y - 40, x + largura_barra/2, y - 40 + altura_barra, false);

draw_set_color(c_lime);
draw_rectangle(x - largura_barra/2, y - 40, x - largura_barra/2 + barra_cheia, y - 40 + altura_barra, false);

draw_set_color(c_white); // Resetar cor