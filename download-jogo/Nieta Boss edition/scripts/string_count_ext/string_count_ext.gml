/// @function string_count_ext(texto, largura_max)
/// Retorna quantas linhas o texto ocupará no draw_text_ext

function string_count_ext(texto, largura_max) {
    var palavras = string_split(texto, " ");
    var linhas = 1;
    var largura_linha = 0;

    for (var i = 0; i < array_length(palavras); i++) {
        var palavra = palavras[i];
        var largura_palavra = string_width(palavra + " ");

        if (largura_linha + largura_palavra > largura_max) {
            linhas += 1;
            largura_linha = largura_palavra;
        } else {
            largura_linha += largura_palavra;
        }
    }

    return linhas;
}
