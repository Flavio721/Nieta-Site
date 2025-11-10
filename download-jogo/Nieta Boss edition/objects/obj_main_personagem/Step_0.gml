ysp += 0.3
xsp = 0

// andar pros lados
if keyboard_check(vk_left)
{
        xsp = -5
}
if keyboard_check(vk_right)
{
        xsp = +5
}

// pular :o
if place_meeting(x, y+1, obj_solido)
{
        ysp = 0
		pulando = false
        if keyboard_check(vk_up)
        {
				pulando = true
                ysp = -10   
        }
}

move_and_collide(xsp, ysp, obj_solido)


// === ANIMAÇÕES ===
// Se estiver no ar: sempre sprite de pulo
if (pulando) {
    if (sprite_index != spr_personagem_subindo) {
        sprite_index = spr_personagem_subindo;
        image_index = 0;
    }
    image_speed = 0.2;
}
else if (keyboard_check(ord("Q"))) {
	if (keyboard_check_pressed(ord("Q"))) {
    // Define a área de ataque, por exemplo um retângulo na frente do personagem
    var ataque_x, ataque_y, ataque_w, ataque_h;

    var alcance = 40; // distância do soco

    if (sprite_index == spr_personagem_direita) {
        ataque_x = x + sprite_width; // na direita do personagem
        ataque_y = y;
    } else {
        ataque_x = x - alcance; // na esquerda
        ataque_y = y;
    }

    ataque_w = alcance;
    ataque_h = sprite_height;

    // Criar uma caixa de colisão para o soco
    var alvo = instance_place(ataque_x, ataque_y, Obj_boss);
	
	    // Criar uma caixa de colisão para o soco
    var alvo = instance_place(ataque_x, ataque_y, obj_npc);

    if (alvo != noone) {
        // Aplicar dano no inimigo
        alvo.hp -= 10;  // valor de dano
        show_debug_message("Inimigo atingido! HP restante: " + string(alvo.hp));
    }
}

    if (sprite_index != spr_personagem_soco) {
        sprite_index = spr_personagem_soco;
        image_index = 0;
    }
    image_speed = 1;
}
else if (keyboard_check(ord("D"))) {
    if (sprite_index != spr_personagem_direita) {
        sprite_index = spr_personagem_direita;
        image_index = 0;
    }
    image_speed = 1;
    x += 4;
}
else if (keyboard_check(ord("A"))) {
    if (sprite_index != spr_personagem_esquerda) {
        sprite_index = spr_personagem_esquerda;
        image_index = 0;
    }
    image_speed = 1;
    x -= 4;
}else if (keyboard_check_pressed(ord("C"))) {
    if (curas_disponiveis > 0 && vida < vida_max) {
        vida += cura_quantidade;
        if (vida > vida_max) vida = vida_max;
        
        curas_disponiveis -= 1;
        show_debug_message("Curado! HP atual: " + string(vida));
        show_debug_message("Curas restantes: " + string(curas_disponiveis));
    } else {
        show_debug_message("Sem curas disponíveis ou HP já cheio!");
    }
}

else {
    if (sprite_index != spr_personagem_parada) {
        sprite_index = spr_personagem_parada;
        image_index = 0;
    }
    image_speed = 0;
}


// Sistema de HP



// Verifica se está colidindo com algum NPC
if (place_meeting(x, y, obj_npc)) {
    // Para evitar dano a todo frame, podemos usar um cooldown (tempo entre danos)
    if (!variable_instance_exists(id, "tempo_ultimo_dano")) {
        tempo_ultimo_dano = 0;
    }
    
    // Conta tempo decorrido
    tempo_ultimo_dano -= 1;
    
    // Se já passou o cooldown, aplica dano
    if (tempo_ultimo_dano <= 0) {
        vida -= 10;  // Dano que o personagem vai tomar
        tempo_ultimo_dano = 30; // Espera 30 frames (meio segundo a 60fps) para aplicar dano novamente
        
        show_debug_message("Dano recebido! Vida atual: " + string(vida));
        
        // Checa se morreu
        if (vida <= 0) {
            instance_destroy(); // destrói personagem (morte)
            show_debug_message("Personagem morreu!");
			room_goto(rm_morte)
        }
    }
}

// Verifica se está colidindo com algum NPC
if (place_meeting(x, y, obj_ataque)) {
    // Para evitar dano a todo frame, podemos usar um cooldown (tempo entre danos)
    if (!variable_instance_exists(id, "tempo_ultimo_dano")) {
        tempo_ultimo_dano = 0;
    }
    
    // Conta tempo decorrido
    tempo_ultimo_dano -= 1;
    
    // Se já passou o cooldown, aplica dano
    if (tempo_ultimo_dano <= 0) {
        vida -= 10;  // Dano que o personagem vai tomar
        tempo_ultimo_dano = 30; // Espera 30 frames (meio segundo a 60fps) para aplicar dano novamente
        
        show_debug_message("Dano recebido! Vida atual: " + string(vida));
        
        // Checa se morreu
        if (vida <= 0) {
            instance_destroy(); // destrói personagem (morte)
            show_debug_message("Personagem morreu!");
			room_goto(rm_morte)
        }
    }
}


if (place_meeting(x, y, obj_morte)) {
	instance_destroy(); // destrói personagem (morte)
    show_debug_message("Personagem morreu!");
	room_goto(rm_morte)
}











// Detecta se chegou no lado direito da tela
if (x >= room_width - sprite_width/2) {
    room_goto_next()
}






