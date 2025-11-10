// Contador para decidir quando mudar de direção
tempo_mudar_direcao -= 1;
if (tempo_mudar_direcao <= 0) {
    // Escolhe nova direção aleatória (-1, 0 ou 1)
    direcao = irandom_range(-1, 1);
    
    // Espera entre 30 e 90 frames antes de mudar de novo
    tempo_mudar_direcao = irandom_range(30, 90);
}

// Move o NPC
x += direcao * velocidade;

// Impede que ele saia da tela (supondo largura de 0 a 1280)
if (x < 0) {
    x = 0;
    direcao = 1;
}
else if (x > 1280) {
    x = 1280;
    direcao = -1;
}


/* Adicionar os sprites do npc andando para cada lado e parado
if (direcao == -1) {
    sprite_index = spr_npc_esquerda;
} else if (direcao == 1) {
    sprite_index = spr_npc_direita;
} else {
    sprite_index = spr_npc_parado;
} 
*/

if (hp <= 0) {
    instance_destroy();
}
