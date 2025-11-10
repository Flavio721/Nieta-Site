#macro au_type_sfx		"SFX"
#macro au_type_music	"MUSIC"


function AudioController(_str_sfx, _str_music, _str_master) constructor{
	global.__audio_controller = self;
	list_audio =  ds_list_create();
	
	global_sfx		=  _str_sfx;
	global_music	= _str_music;
	global_master	= _str_master;
	
	//@method Update()
	static Update = function(){
			vol_sfx		= variable_global_get(global_sfx) * variable_global_get(global_master);
			vol_music	= variable_global_get(global_music) * variable_global_get(global_master)
			
			var _size = ds_list_size(list_audio)
			for(var i = 0; i < _size; i++){
			list_audio[| i].Update() // | Para o leitor da lista funcionar
			
		}
	}
}

function AudioElement() constructor {
	controller = global.__audio_controller = self;
	
	//Se adicionando a si mesmo a lista de audio
	ds_list_add(controller.list_audio, self)
	
	play		= true;
	sound_id	= noone;
	type		= noone;
	offset		= 1;
}