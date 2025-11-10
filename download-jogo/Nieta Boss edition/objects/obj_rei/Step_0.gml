// MOVIMENTAÇÃO
var _dir = keyboard_check(ord("D"));
var _esq = 0; // Não está usando tecla A por enquanto, pode expandir depois
velh = (_dir - _esq) * vel_geral;
x += velh;

// SPRITE DE MOVIMENTO
if (keyboard_check(ord("D"))) {
    sprite_index = spr_rei_direita;
    image_speed = 1;
    x += 4; // cuidado pra não duplicar movimento se já somou com velh
} else {
    sprite_index = spr_rei_parado;
    image_speed = 0;
    image_index = 0;
}




