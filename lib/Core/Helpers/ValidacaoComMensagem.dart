class ValidacaoComMensagem {
  ValidacaoComMensagem(this.valido, this.mensagem);
  ValidacaoComMensagem.valido([this.mensagem]) : valido = true;
  ValidacaoComMensagem.invalido(this.mensagem) : valido = false;

  final bool valido;
  final String? mensagem;
}
