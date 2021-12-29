import '../../Enums/Financas/TipoDePessoa.dart';
import 'PossuiId.dart';

class Pessoa extends PossuiId {
  final String nome;
  final String? email;
  final String? telefone;
  final String cpfCnpj;
  final String? observacao;
  final TipoDePessoa tipo;

  Pessoa({
    String? id,
    required this.nome,
    this.email,
    this.telefone,
    required this.cpfCnpj,
    this.observacao,
    required this.tipo,
  }) : super(id: id);

  //TODO: Criar as validações
  bool get emailEhValido => true;
  bool get telefoneEhValido => true;
  bool get cpfCnpjEhValido => true;

  //TODO: Criar as formatações
  String get cpfCnpjFormatado => '';
  String get telefoneFormatado => '';
}
