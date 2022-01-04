import 'package:juntapay/Layers/Data/Database/Drift/DriftSqliteDatabase.dart';
import 'package:juntapay/Layers/Dominio/Entidades/Financas/ContaBancaria.dart';
import 'package:juntapay/Layers/Dominio/Entidades/Financas/InstituicaoBancaria.dart';
import 'package:juntapay/Layers/Dominio/Enums/Financas/TipoDeContaBancaria.dart';
import 'package:juntapay/Layers/Dominio/Mappers/Comuns/PessoaMapper.dart';

import '../IMapper.dart';

class ContaBancariaMapper extends IMapper {
  static ContaBancariaEntity fromMap(Map<String, dynamic> map) {
    return ContaBancariaEntity(
      id: map['id'],
      nome: map['nome'],
      tipo: (map['tipo'] as int).toTipoDeContaBancaria,
      agencia: map['agencia'],
      instituicaoBancaria: map['instituicaoBancaria'], // FAZER O ENUM
      numeroDaConta: map['numeroDaConta'],
      titularDaConta: PessoaMapper.fromMap(map['titularDaConta']),
      observacao: map['observacao'],
      dataDeCriacao: DateTime.parse(map['dataDeCriacao']),
    );
  }

  static Map<String, dynamic> toMap(ContaBancariaEntity entity) {
    return {
      'id': entity.id,
      'nome': entity.nome,
      'tipo': entity.tipo.toIndex,
      'agencia': entity.agencia,
      'instituicaoBancaria': 'FAZER O ENUM',
      'numeroDaConta': entity.numeroDaConta,
      'titularDaConta': PessoaMapper.toMap(entity.titularDaConta),
      'observacao': entity.observacao,
      'dataDeCriacao': entity.dataDeCriacao.toIso8601String(),
    };
  }

  static ContaBancariaEntity fromTable(ContaBancaria table, Pessoa titularDaConta) {
    return ContaBancariaEntity(
      id: table.id,
      nome: table.nome,
      tipo: table.tipo.toTipoDeContaBancaria,
      agencia: table.agencia,
      instituicaoBancaria: InstituicaoBancaria.BancoDoBrasil,
      numeroDaConta: table.numeroDaConta,
      titularDaConta: PessoaMapper.fromTable(titularDaConta),
      observacao: table.observacao,
      dataDeCriacao: table.dataDeCriacao,
    );
  }

  static ContaBancaria toTable(ContaBancariaEntity entity) {
    return ContaBancaria(
      id: entity.id,
      nome: entity.nome,
      tipo: entity.tipo.toIndex,
      agencia: entity.agencia,
      instituicaoBancaria: 0,
      numeroDaConta: entity.numeroDaConta,
      idTitularDaConta: entity.titularDaConta.id,
      observacao: entity.observacao,
      dataDeCriacao: entity.dataDeCriacao,
    );
  }
}
