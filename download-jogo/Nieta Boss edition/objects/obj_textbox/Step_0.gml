// get input
var confirm = keyboard_check_pressed(confirm_key);

// escrever o texto
text_progress = min(text_progress + text_speed, text_lenght);

// terminou de escrever
if (text_progress == text_lenght) {
	if (confirm) {
		next();
	}
}
else if (confirm) {
	text_progress = text_lenght;
}