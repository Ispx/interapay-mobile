import '../../Enums/Financas/TipoDeContaBancaria.dart';
import '../Comuns/Pessoa.dart';
import '../Comuns/PossuiId.dart';
import 'InstituicaoBancaria.dart';

class ContaBancariaEntity extends PossuiId {
  String nome;
  TipoDeContaBancaria tipo;
  String? observacao;
  final PessoaEntity titularDaConta;
  final int agencia;
  final int numeroDaConta;
  final InstituicaoBancariaEntity instituicaoBancaria;

  ContaBancariaEntity({
    String? id,
    required this.nome,
    required this.tipo,
    this.observacao,
    required this.titularDaConta,
    required this.agencia,
    required this.numeroDaConta,
    required this.instituicaoBancaria,
  }) : super(id: id);
}

