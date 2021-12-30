import 'ContaBancaria.dart';
import '../../../../Core/Helpers/JuntaUtils.dart';
import '../../../../Core/Helpers/ValidacaoComMensagem.dart';
import '../../../../Core/Configuracoes.dart';
import '../Comuns/ParticipanteDaDespesa.dart';
import '../Comuns/PossuiId.dart';
import '../../Enums/Comuns/Assinatura.dart';
import '../../Enums/Financas/FormaDePagamento.dart';

class Despesa extends PossuiId {
  Despesa({
    String? id,
    required this.valorTotal,
    this.formaDePagamento = FormaDePagamento.Pix,
    this.contaBancaria,
    this.chavePix,
    this.obrigarComprovante = true,
    this.observacoes,
    this.comprovante,
    List<ParticipanteDaDespesa>? amigos,
  }) : super(id: id) {
    _amigos = amigos ?? [];
  }

  double valorTotal;
  FormaDePagamento formaDePagamento;
  ContaBancaria? contaBancaria;
  String? chavePix;
  bool obrigarComprovante;
  String? comprovante;
  String? observacoes;
  final DateTime dataDeCriacao = DateTime.now();

  late final List<ParticipanteDaDespesa> _amigos;
  List<ParticipanteDaDespesa> get amigos => _amigos;

  void adicionarAmigo(ParticipanteDaDespesa amigo) => _amigos.add(amigo);
  void adicionarAmigos(List<ParticipanteDaDespesa> amigos) => _amigos.addAll(amigos);

  ValidacaoComMensagem validar() {
    ValidacaoComMensagem validacao = ValidacaoComMensagem.valido();

    validacao = validarAmigos();
    if (validacao.valido == false) return validacao;

    validacao = validarFormaDePagamento();
    if (validacao.valido == false) return validacao;

    return validacao;
  }

  ValidacaoComMensagem validarAmigos() {
    ValidacaoComMensagem validacao = ValidacaoComMensagem.valido();

    if (amigos.length <= 1) validacao = ValidacaoComMensagem.invalido('Adicione pelo menos um amigo');

    if (Configuracoes.assinatura == Assinatura.Gratis && amigos.length > 5)
      //TODO: Oferecer para o usuário a assinatura paga para adicionar mais de 5 amigos
      return ValidacaoComMensagem.invalido('TODO: Oferecer para o usuário a assinatura paga para adicionar mais de 5 amigos');

    if (valorTotal <= 0.0) validacao = ValidacaoComMensagem.invalido('Informe um valor total maior que zero');

    for (var i = 0; i < amigos.length; i++) {
      ParticipanteDaDespesa _amigo = amigos[i];

      bool valido = _amigo.validar().valido;

      if (valido == false) validacao = ValidacaoComMensagem.invalido('Informe um valor maior que zero para o ${_amigo.nome}');
    }

    return validacao;
  }

  ValidacaoComMensagem validarFormaDePagamento() {
    ValidacaoComMensagem validacao = ValidacaoComMensagem.valido();

    if (formaDePagamento == FormaDePagamento.Pix && JuntaPayUtils.isNotEmpty(chavePix) == false)
      validacao = ValidacaoComMensagem.invalido('Informe a chave pix');

    if (formaDePagamento == FormaDePagamento.TransferenciaBancaria && contaBancaria == null)
      validacao = ValidacaoComMensagem.invalido('Informe uma conta bancária');

    if (formaDePagamento != FormaDePagamento.Dinheiro && obrigarComprovante == true && comprovante == null)
      validacao = ValidacaoComMensagem.invalido('Envie um comprovante');

    return validacao;
  }
}
