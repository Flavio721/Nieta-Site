#macro TEXT new TextAction

function DialogueAction() constructor{
	act = function() { };
}

// definir um novo texto pra escrever
function TextAction(_text) : DialogueAction() constructor {
	text = _text
	
	act = function(textbox) {
		textbox.setText(text);
	}
}