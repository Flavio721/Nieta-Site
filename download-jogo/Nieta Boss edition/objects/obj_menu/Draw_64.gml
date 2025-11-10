draw_set_font(ft_menu);

var dist = 55;
var gui_largura = display_get_gui_width();
var gui_altura = display_get_gui_height();
var x1 = gui_largura / 2;
var y2 = gui_altura / 2;

for (var i = 0; i < array_length(opcoes); i++) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);

    if (index == i) {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_white);
    }

	draw_text(x1, y2 + (i * dist), array_get(opcoes, i));
}

draw_set_font(-1);
