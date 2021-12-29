import '../../../../Core/Helpers/JuntaUtils.dart';
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

  //TODO: Criar a validação de telefone
  bool get emailEhValido => JuntaPayUtils.isNotEmpty(email) ? JuntaPayUtils.isValidEmail(email!) : false;
  bool get telefoneEhValido => throw UnimplementedError();
  bool get cpfCnpjEhValido => JuntaPayUtils.isNotEmpty(cpfCnpj) ? JuntaPayUtils.isValidCpfCnpj(cpfCnpj) : false;

  //TODO: Criar a formatação de telefone
  String get cpfCnpjFormatado => JuntaPayUtils.formatarCpfCnpj(cpfCnpj);
  String get telefoneFormatado =>  throw UnimplementedError();
}