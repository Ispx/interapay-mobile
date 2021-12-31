import '../Comuns/PossuiId.dart';

class InstituicaoBancariaEntity extends PossuiId {
  final String nome;

  InstituicaoBancariaEntity({
    String? id,
    required this.nome,
  }) : super(id: id);
}
