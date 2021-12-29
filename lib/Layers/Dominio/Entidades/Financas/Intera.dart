import '../../../../Core/Helpers/JuntaUtils.dart';
import '../../../../Core/Helpers/ValidacaoComMensagem.dart';
import '../Comuns/ParticipanteDaIntera.dart';
import '../Comuns/PossuiId.dart';
import '../../Enums/Financas/FormaDePagamento.dart';
import 'ContaBancaria.dart';

class Intera extends PossuiId {
  Intera({
    String? id,
    required this.valorTotal,
    this.formaDePagamento = FormaDePagamento.Pix,
    this.contaBancaria,
    this.chavePix,
    this.obrigarComprovante = true,
    this.observacoes,
    this.comprovante,
    List<ParticipanteDaIntera>? amigos,
  }) : super(id: id) {
    _amigos = amigos ?? [];
  }

  final double valorTotal;
  final FormaDePagamento formaDePagamento;
  final ContaBancaria? contaBancaria;
  final String? chavePix;
  final bool obrigarComprovante;
  final String? observacoes;
  final String? comprovante;
  late final List<ParticipanteDaIntera> _amigos;
  final DateTime dataDeCriacao = DateTime.now();

  List<ParticipanteDaIntera> get amigos => _amigos;

  void adicionarAmigo(ParticipanteDaIntera amigo) => _amigos.add(amigo);
  void adicionarAmigos(List<ParticipanteDaIntera> amigos) => _amigos.addAll(amigos);

  ValidacaoComMensagem validar() {
    if (valorTotal <= 0.0) return ValidacaoComMensagem.invalido('Informe um valor total maior que zero');

    if (formaDePagamento == FormaDePagamento.Pix && JuntaPayUtils.isNotEmpty(chavePix) == false)
      return ValidacaoComMensagem.invalido('Informe a chave pix');

    if (formaDePagamento == FormaDePagamento.TransferenciaBancaria && contaBancaria == null)
      return ValidacaoComMensagem.invalido('Informe uma conta bancária');

    if (obrigarComprovante == true && comprovante == null) return ValidacaoComMensagem.invalido('Envie um comprovante');

    if (amigos.isEmpty) return ValidacaoComMensagem.invalido('Adicione pelo menos um amigo');

    return ValidacaoComMensagem.valido();
  }
}
