import '../../Enums/Financas/TipoDeContaBancaria.dart';
import '../Comuns/Pessoa.dart';
import '../Comuns/PossuiId.dart';
import 'InstituicaoBancaria.dart';

class ContaBancaria extends PossuiId {
  String nome;
  TipoDeContaBancaria tipo;
  String? descricao;
  final Pessoa titularDaConta;
  final int agencia;
  final int numeroDaConta;
  final InstituacaoBancaria instituicaoBancaria;

  ContaBancaria({
    String? id,
    required this.nome,
    required this.tipo,
    this.descricao,
    required this.titularDaConta,
    required this.agencia,
    required this.numeroDaConta,
    required this.instituicaoBancaria,
  }) : super(id: id);
}

