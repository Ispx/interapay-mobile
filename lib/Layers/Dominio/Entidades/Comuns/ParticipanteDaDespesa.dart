import '../../../../Core/Helpers/ValidacaoComMensagem.dart';
import 'Pessoa.dart';

class ParticipanteDaDespesa extends Pessoa {
  ParticipanteDaDespesa({
    required Pessoa pessoa,
    required this.valorASerPago,
  }) : super(
          id: pessoa.id,
          nome: pessoa.nome,
          email: pessoa.email,
          telefone: pessoa.telefone,
          cpfCnpj: pessoa.cpfCnpj,
          observacao: pessoa.observacao,
          tipo: pessoa.tipo,
        );

  double valorASerPago;

  ValidacaoComMensagem validar() {
    if (valorASerPago <= 0.0) return ValidacaoComMensagem.invalido('Informe um valor maior que zero');

    return ValidacaoComMensagem.valido();
  }
}
