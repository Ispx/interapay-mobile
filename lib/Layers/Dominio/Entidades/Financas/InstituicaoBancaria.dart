import '../Comuns/PossuiId.dart';

class InstituacaoBancaria extends PossuiId {
  final String nome;

  InstituacaoBancaria({
    String? id,
    required this.nome,
  }) : super(id: id);
}
