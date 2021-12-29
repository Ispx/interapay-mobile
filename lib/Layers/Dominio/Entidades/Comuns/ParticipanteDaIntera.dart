import 'Pessoa.dart';

class ParticipanteDaIntera extends Pessoa {
  final double valorASerPago;
  ParticipanteDaIntera({
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
}
