import '../Comuns/PossuiId.dart';

class InstituicaoBancaria extends PossuiId {
  final String nome;

  InstituicaoBancaria({
    String? id,
    required this.nome,
  }) : super(id: id);
}
