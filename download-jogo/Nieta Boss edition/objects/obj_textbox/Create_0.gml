/// propriedades customizaveis

// input
confirm_key = ord("E"); // botão para a proxima caixa de texto

// posicao
margin = 16;
padding = 8;
widht = display_get_gui_width() - margin * 2;
height = sprite_height

x = (display_get_gui_width() - widht) / 2;
y = display_get_gui_height() - height - margin;

// texto
text_font = fnt_dialogue
text_color = c_white;
text_speed = 0.6;
text_x = padding;
text_y = padding;
text_widht = widht - padding * 2;

/// propriedades privadas (nao trocar)
actions = [];
current_action = -1;

text = "";
text_progress = 0;
text_lenght = 0;

/// metodos

//comecar o dialogo
setTopic = function(topic) {
	actions = global.topics[$ topic];
	current_action = -1;
	
	next()
}

// mover pra proxima acao ou fechar quando nao tiver mais acoes
next = function() {
	current_action++;
	if(current_action >= array_length(actions)) {
		instance_destroy();
	}
	else {
		actions[current_action].act(id);
	}
}

// setar o texto que vai ser colocado
setText = function(newText) {
	text = newText;
	text_lenght = string_length(newText);
	total_progress = 0;
}
























