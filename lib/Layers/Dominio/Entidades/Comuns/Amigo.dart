import '../../Enums/Financas/TipoDePessoa.dart';
import 'Pessoa.dart';

class Amigo extends Pessoa {
  Amigo(
    String? id,
    String nome,
    String? email,
    String? telefone,
    String cpfCnpj,
    String? observacao,
    TipoDePessoa tipo,
  ) : super(
          id: id,
          nome: nome,
          email: email,
          telefone: telefone,
          cpfCnpj: cpfCnpj,
          observacao: observacao,
          tipo: tipo,
        );
}
