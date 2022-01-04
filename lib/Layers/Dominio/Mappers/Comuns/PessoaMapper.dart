import '../../../Data/Database/Drift/DriftSqliteDatabase.dart';
import '../../Entidades/Comuns/Pessoa.dart';
import '../../Enums/Financas/TipoDePessoa.dart';
import '../IMapper.dart';

class PessoaMapper extends IMapper {
  static PessoaEntity fromMap(Map<String, dynamic> map) {
    return PessoaEntity(
      id: map['id'],
      nome: map['nome'],
      tipoDePessoa: (map['tipo'] as int).toTipoDePessoa,
      cpfCnpj: map['cpfCnpj'],
      email: map['email'],
      telefone: map['telefone'],
      observacao: map['observacao'],
      dataDeCriacao: DateTime.parse(map['dataDeCriacao']),
    );
  }

  static Map<String, dynamic> toMap(PessoaEntity entity) {
    return {
      'id': entity.id,
      'nome': entity.nome,
      'tipo': entity.tipoDePessoa.toIndex,
      'cpfCnpj': entity.cpfCnpj,
      'email': entity.email,
      'telefone': entity.telefone,
      'observacao': entity.observacao,
      'dataDeCriacao': entity.dataDeCriacao,
    };
  }

  static PessoaEntity fromTable(Pessoa table) {
    return PessoaEntity(
      id: table.id,
      nome: table.nome,
      tipoDePessoa: table.tipoDePessoa.toTipoDePessoa,
      cpfCnpj: table.cpfCnpj,
      email: table.email,
      telefone: table.telefone,
      observacao: table.observacao,
      dataDeCriacao: table.dataDeCriacao,
    );
  }

  static Pessoa toTable(PessoaEntity entity) {
    return Pessoa(
      id: entity.id,
      nome: entity.nome,
      tipoDePessoa: entity.tipoDePessoa.toIndex,
      cpfCnpj: entity.cpfCnpj,
      email: entity.email,
      telefone: entity.telefone,
      observacao: entity.observacao,
      dataDeCriacao: entity.dataDeCriacao,
    );
  }
}
