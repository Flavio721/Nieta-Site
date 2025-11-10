if (hp <= 0) {
    instance_destroy();
}

// Contagem de tempo
tiro_timer += delta_time / 1000000; // delta_time em segundos

if (tiro_timer >= tiro_tempo) {
    
    if (modo_tiro == 0) {
        // Laterais (meio de cada lado)
        var t;
        t = instance_create_layer(x + sprite_width/2, y, "Instances", obj_ataque);
        t.direction = 0; // direita
        
        t = instance_create_layer(x - sprite_width/2, y, "Instances", obj_ataque);
        t.direction = 180; // esquerda
        
        t = instance_create_layer(x, y - sprite_height/2, "Instances", obj_ataque);
        t.direction = 90; // cima
        
        t = instance_create_layer(x, y + sprite_height/2, "Instances", obj_ataque);
        t.direction = 270; // baixo
    } 
    else {
        // Quinas
        var t;
        t = instance_create_layer(x - sprite_width/2, y - sprite_height/2, "Instances", obj_ataque);
        t.direction = 135; // cima-esquerda
        
        t = instance_create_layer(x + sprite_width/2, y - sprite_height/2, "Instances", obj_ataque);
        t.direction = 45; // cima-direita
        
        t = instance_create_layer(x - sprite_width/2, y + sprite_height/2, "Instances", obj_ataque);
        t.direction = 225; // baixo-esquerda
        
        t = instance_create_layer(x + sprite_width/2, y + sprite_height/2, "Instances", obj_ataque);
        t.direction = 315; // baixo-direita
    }

    // Alternar modo
    modo_tiro = 1 - modo_tiro;

    // Resetar timer
    tiro_timer = 0;
}