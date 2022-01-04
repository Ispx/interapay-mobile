// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DriftSqliteDatabase.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Comprovante extends DataClass implements Insertable<Comprovante> {
  final String id;
  final Uint8List imagem;
  Comprovante({required this.id, required this.imagem});
  factory Comprovante.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Comprovante(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      imagem: const BlobType()
          .mapFromDatabaseResponse(data['${effectivePrefix}imagem'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['imagem'] = Variable<Uint8List>(imagem);
    return map;
  }

  ComprovantesCompanion toCompanion(bool nullToAbsent) {
    return ComprovantesCompanion(
      id: Value(id),
      imagem: Value(imagem),
    );
  }

  factory Comprovante.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Comprovante(
      id: serializer.fromJson<String>(json['id']),
      imagem: serializer.fromJson<Uint8List>(json['imagem']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'imagem': serializer.toJson<Uint8List>(imagem),
    };
  }

  Comprovante copyWith({String? id, Uint8List? imagem}) => Comprovante(
        id: id ?? this.id,
        imagem: imagem ?? this.imagem,
      );
  @override
  String toString() {
    return (StringBuffer('Comprovante(')
          ..write('id: $id, ')
          ..write('imagem: $imagem')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, imagem);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Comprovante &&
          other.id == this.id &&
          other.imagem == this.imagem);
}

class ComprovantesCompanion extends UpdateCompanion<Comprovante> {
  final Value<String> id;
  final Value<Uint8List> imagem;
  const ComprovantesCompanion({
    this.id = const Value.absent(),
    this.imagem = const Value.absent(),
  });
  ComprovantesCompanion.insert({
    required String id,
    required Uint8List imagem,
  })  : id = Value(id),
        imagem = Value(imagem);
  static Insertable<Comprovante> custom({
    Expression<String>? id,
    Expression<Uint8List>? imagem,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (imagem != null) 'imagem': imagem,
    });
  }

  ComprovantesCompanion copyWith(
      {Value<String>? id, Value<Uint8List>? imagem}) {
    return ComprovantesCompanion(
      id: id ?? this.id,
      imagem: imagem ?? this.imagem,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (imagem.present) {
      map['imagem'] = Variable<Uint8List>(imagem.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComprovantesCompanion(')
          ..write('id: $id, ')
          ..write('imagem: $imagem')
          ..write(')'))
        .toString();
  }
}

class $ComprovantesTable extends Comprovantes
    with TableInfo<$ComprovantesTable, Comprovante> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ComprovantesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imagemMeta = const VerificationMeta('imagem');
  @override
  late final GeneratedColumn<Uint8List?> imagem = GeneratedColumn<Uint8List?>(
      'imagem', aliasedName, false,
      type: const BlobType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, imagem];
  @override
  String get aliasedName => _alias ?? 'comprovantes';
  @override
  String get actualTableName => 'comprovantes';
  @override
  VerificationContext validateIntegrity(Insertable<Comprovante> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('imagem')) {
      context.handle(_imagemMeta,
          imagem.isAcceptableOrUnknown(data['imagem']!, _imagemMeta));
    } else if (isInserting) {
      context.missing(_imagemMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Comprovante map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Comprovante.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ComprovantesTable createAlias(String alias) {
    return $ComprovantesTable(_db, alias);
  }
}

class Pessoa extends DataClass implements Insertable<Pessoa> {
  final String id;
  final String nome;
  final String? email;
  final String? telefone;
  final String cpfCnpj;
  final String? observacao;
  final int tipoDePessoa;
  final DateTime dataDeCriacao;
  Pessoa(
      {required this.id,
      required this.nome,
      this.email,
      this.telefone,
      required this.cpfCnpj,
      this.observacao,
      required this.tipoDePessoa,
      required this.dataDeCriacao});
  factory Pessoa.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Pessoa(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      nome: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nome'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email']),
      telefone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}telefone']),
      cpfCnpj: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cpf_cnpj'])!,
      observacao: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}observacao']),
      tipoDePessoa: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tipo_de_pessoa'])!,
      dataDeCriacao: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}data_de_criacao'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['nome'] = Variable<String>(nome);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String?>(email);
    }
    if (!nullToAbsent || telefone != null) {
      map['telefone'] = Variable<String?>(telefone);
    }
    map['cpf_cnpj'] = Variable<String>(cpfCnpj);
    if (!nullToAbsent || observacao != null) {
      map['observacao'] = Variable<String?>(observacao);
    }
    map['tipo_de_pessoa'] = Variable<int>(tipoDePessoa);
    map['data_de_criacao'] = Variable<DateTime>(dataDeCriacao);
    return map;
  }

  PessoasCompanion toCompanion(bool nullToAbsent) {
    return PessoasCompanion(
      id: Value(id),
      nome: Value(nome),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      telefone: telefone == null && nullToAbsent
          ? const Value.absent()
          : Value(telefone),
      cpfCnpj: Value(cpfCnpj),
      observacao: observacao == null && nullToAbsent
          ? const Value.absent()
          : Value(observacao),
      tipoDePessoa: Value(tipoDePessoa),
      dataDeCriacao: Value(dataDeCriacao),
    );
  }

  factory Pessoa.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pessoa(
      id: serializer.fromJson<String>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      email: serializer.fromJson<String?>(json['email']),
      telefone: serializer.fromJson<String?>(json['telefone']),
      cpfCnpj: serializer.fromJson<String>(json['cpfCnpj']),
      observacao: serializer.fromJson<String?>(json['observacao']),
      tipoDePessoa: serializer.fromJson<int>(json['tipoDePessoa']),
      dataDeCriacao: serializer.fromJson<DateTime>(json['dataDeCriacao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'nome': serializer.toJson<String>(nome),
      'email': serializer.toJson<String?>(email),
      'telefone': serializer.toJson<String?>(telefone),
      'cpfCnpj': serializer.toJson<String>(cpfCnpj),
      'observacao': serializer.toJson<String?>(observacao),
      'tipoDePessoa': serializer.toJson<int>(tipoDePessoa),
      'dataDeCriacao': serializer.toJson<DateTime>(dataDeCriacao),
    };
  }

  Pessoa copyWith(
          {String? id,
          String? nome,
          String? email,
          String? telefone,
          String? cpfCnpj,
          String? observacao,
          int? tipoDePessoa,
          DateTime? dataDeCriacao}) =>
      Pessoa(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        email: email ?? this.email,
        telefone: telefone ?? this.telefone,
        cpfCnpj: cpfCnpj ?? this.cpfCnpj,
        observacao: observacao ?? this.observacao,
        tipoDePessoa: tipoDePessoa ?? this.tipoDePessoa,
        dataDeCriacao: dataDeCriacao ?? this.dataDeCriacao,
      );
  @override
  String toString() {
    return (StringBuffer('Pessoa(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('email: $email, ')
          ..write('telefone: $telefone, ')
          ..write('cpfCnpj: $cpfCnpj, ')
          ..write('observacao: $observacao, ')
          ..write('tipoDePessoa: $tipoDePessoa, ')
          ..write('dataDeCriacao: $dataDeCriacao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, email, telefone, cpfCnpj,
      observacao, tipoDePessoa, dataDeCriacao);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pessoa &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.email == this.email &&
          other.telefone == this.telefone &&
          other.cpfCnpj == this.cpfCnpj &&
          other.observacao == this.observacao &&
          other.tipoDePessoa == this.tipoDePessoa &&
          other.dataDeCriacao == this.dataDeCriacao);
}

class PessoasCompanion extends UpdateCompanion<Pessoa> {
  final Value<String> id;
  final Value<String> nome;
  final Value<String?> email;
  final Value<String?> telefone;
  final Value<String> cpfCnpj;
  final Value<String?> observacao;
  final Value<int> tipoDePessoa;
  final Value<DateTime> dataDeCriacao;
  const PessoasCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.email = const Value.absent(),
    this.telefone = const Value.absent(),
    this.cpfCnpj = const Value.absent(),
    this.observacao = const Value.absent(),
    this.tipoDePessoa = const Value.absent(),
    this.dataDeCriacao = const Value.absent(),
  });
  PessoasCompanion.insert({
    required String id,
    required String nome,
    this.email = const Value.absent(),
    this.telefone = const Value.absent(),
    required String cpfCnpj,
    this.observacao = const Value.absent(),
    required int tipoDePessoa,
    this.dataDeCriacao = const Value.absent(),
  })  : id = Value(id),
        nome = Value(nome),
        cpfCnpj = Value(cpfCnpj),
        tipoDePessoa = Value(tipoDePessoa);
  static Insertable<Pessoa> custom({
    Expression<String>? id,
    Expression<String>? nome,
    Expression<String?>? email,
    Expression<String?>? telefone,
    Expression<String>? cpfCnpj,
    Expression<String?>? observacao,
    Expression<int>? tipoDePessoa,
    Expression<DateTime>? dataDeCriacao,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (email != null) 'email': email,
      if (telefone != null) 'telefone': telefone,
      if (cpfCnpj != null) 'cpf_cnpj': cpfCnpj,
      if (observacao != null) 'observacao': observacao,
      if (tipoDePessoa != null) 'tipo_de_pessoa': tipoDePessoa,
      if (dataDeCriacao != null) 'data_de_criacao': dataDeCriacao,
    });
  }

  PessoasCompanion copyWith(
      {Value<String>? id,
      Value<String>? nome,
      Value<String?>? email,
      Value<String?>? telefone,
      Value<String>? cpfCnpj,
      Value<String?>? observacao,
      Value<int>? tipoDePessoa,
      Value<DateTime>? dataDeCriacao}) {
    return PessoasCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      telefone: telefone ?? this.telefone,
      cpfCnpj: cpfCnpj ?? this.cpfCnpj,
      observacao: observacao ?? this.observacao,
      tipoDePessoa: tipoDePessoa ?? this.tipoDePessoa,
      dataDeCriacao: dataDeCriacao ?? this.dataDeCriacao,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (email.present) {
      map['email'] = Variable<String?>(email.value);
    }
    if (telefone.present) {
      map['telefone'] = Variable<String?>(telefone.value);
    }
    if (cpfCnpj.present) {
      map['cpf_cnpj'] = Variable<String>(cpfCnpj.value);
    }
    if (observacao.present) {
      map['observacao'] = Variable<String?>(observacao.value);
    }
    if (tipoDePessoa.present) {
      map['tipo_de_pessoa'] = Variable<int>(tipoDePessoa.value);
    }
    if (dataDeCriacao.present) {
      map['data_de_criacao'] = Variable<DateTime>(dataDeCriacao.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PessoasCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('email: $email, ')
          ..write('telefone: $telefone, ')
          ..write('cpfCnpj: $cpfCnpj, ')
          ..write('observacao: $observacao, ')
          ..write('tipoDePessoa: $tipoDePessoa, ')
          ..write('dataDeCriacao: $dataDeCriacao')
          ..write(')'))
        .toString();
  }
}

class $PessoasTable extends Pessoas with TableInfo<$PessoasTable, Pessoa> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PessoasTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String?> nome = GeneratedColumn<String?>(
      'nome', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _telefoneMeta = const VerificationMeta('telefone');
  @override
  late final GeneratedColumn<String?> telefone = GeneratedColumn<String?>(
      'telefone', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _cpfCnpjMeta = const VerificationMeta('cpfCnpj');
  @override
  late final GeneratedColumn<String?> cpfCnpj = GeneratedColumn<String?>(
      'cpf_cnpj', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _observacaoMeta = const VerificationMeta('observacao');
  @override
  late final GeneratedColumn<String?> observacao = GeneratedColumn<String?>(
      'observacao', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _tipoDePessoaMeta =
      const VerificationMeta('tipoDePessoa');
  @override
  late final GeneratedColumn<int?> tipoDePessoa = GeneratedColumn<int?>(
      'tipo_de_pessoa', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _dataDeCriacaoMeta =
      const VerificationMeta('dataDeCriacao');
  @override
  late final GeneratedColumn<DateTime?> dataDeCriacao =
      GeneratedColumn<DateTime?>('data_de_criacao', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [
        id,
        nome,
        email,
        telefone,
        cpfCnpj,
        observacao,
        tipoDePessoa,
        dataDeCriacao
      ];
  @override
  String get aliasedName => _alias ?? 'pessoas';
  @override
  String get actualTableName => 'pessoas';
  @override
  VerificationContext validateIntegrity(Insertable<Pessoa> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('telefone')) {
      context.handle(_telefoneMeta,
          telefone.isAcceptableOrUnknown(data['telefone']!, _telefoneMeta));
    }
    if (data.containsKey('cpf_cnpj')) {
      context.handle(_cpfCnpjMeta,
          cpfCnpj.isAcceptableOrUnknown(data['cpf_cnpj']!, _cpfCnpjMeta));
    } else if (isInserting) {
      context.missing(_cpfCnpjMeta);
    }
    if (data.containsKey('observacao')) {
      context.handle(
          _observacaoMeta,
          observacao.isAcceptableOrUnknown(
              data['observacao']!, _observacaoMeta));
    }
    if (data.containsKey('tipo_de_pessoa')) {
      context.handle(
          _tipoDePessoaMeta,
          tipoDePessoa.isAcceptableOrUnknown(
              data['tipo_de_pessoa']!, _tipoDePessoaMeta));
    } else if (isInserting) {
      context.missing(_tipoDePessoaMeta);
    }
    if (data.containsKey('data_de_criacao')) {
      context.handle(
          _dataDeCriacaoMeta,
          dataDeCriacao.isAcceptableOrUnknown(
              data['data_de_criacao']!, _dataDeCriacaoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pessoa map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Pessoa.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PessoasTable createAlias(String alias) {
    return $PessoasTable(_db, alias);
  }
}

class ContaBancaria extends DataClass implements Insertable<ContaBancaria> {
  final String id;
  final String idTitularDaConta;
  final String nome;
  final int agencia;
  final int numeroDaConta;
  final String? observacao;
  final int tipo;
  final int instituicaoBancaria;
  final DateTime dataDeCriacao;
  ContaBancaria(
      {required this.id,
      required this.idTitularDaConta,
      required this.nome,
      required this.agencia,
      required this.numeroDaConta,
      this.observacao,
      required this.tipo,
      required this.instituicaoBancaria,
      required this.dataDeCriacao});
  factory ContaBancaria.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ContaBancaria(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idTitularDaConta: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_titular_da_conta'])!,
      nome: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nome'])!,
      agencia: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}agencia'])!,
      numeroDaConta: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}numero_da_conta'])!,
      observacao: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}observacao']),
      tipo: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tipo'])!,
      instituicaoBancaria: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}instituicao_bancaria'])!,
      dataDeCriacao: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}data_de_criacao'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['id_titular_da_conta'] = Variable<String>(idTitularDaConta);
    map['nome'] = Variable<String>(nome);
    map['agencia'] = Variable<int>(agencia);
    map['numero_da_conta'] = Variable<int>(numeroDaConta);
    if (!nullToAbsent || observacao != null) {
      map['observacao'] = Variable<String?>(observacao);
    }
    map['tipo'] = Variable<int>(tipo);
    map['instituicao_bancaria'] = Variable<int>(instituicaoBancaria);
    map['data_de_criacao'] = Variable<DateTime>(dataDeCriacao);
    return map;
  }

  ContasBancariasCompanion toCompanion(bool nullToAbsent) {
    return ContasBancariasCompanion(
      id: Value(id),
      idTitularDaConta: Value(idTitularDaConta),
      nome: Value(nome),
      agencia: Value(agencia),
      numeroDaConta: Value(numeroDaConta),
      observacao: observacao == null && nullToAbsent
          ? const Value.absent()
          : Value(observacao),
      tipo: Value(tipo),
      instituicaoBancaria: Value(instituicaoBancaria),
      dataDeCriacao: Value(dataDeCriacao),
    );
  }

  factory ContaBancaria.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContaBancaria(
      id: serializer.fromJson<String>(json['id']),
      idTitularDaConta: serializer.fromJson<String>(json['idTitularDaConta']),
      nome: serializer.fromJson<String>(json['nome']),
      agencia: serializer.fromJson<int>(json['agencia']),
      numeroDaConta: serializer.fromJson<int>(json['numeroDaConta']),
      observacao: serializer.fromJson<String?>(json['observacao']),
      tipo: serializer.fromJson<int>(json['tipo']),
      instituicaoBancaria:
          serializer.fromJson<int>(json['instituicaoBancaria']),
      dataDeCriacao: serializer.fromJson<DateTime>(json['dataDeCriacao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'idTitularDaConta': serializer.toJson<String>(idTitularDaConta),
      'nome': serializer.toJson<String>(nome),
      'agencia': serializer.toJson<int>(agencia),
      'numeroDaConta': serializer.toJson<int>(numeroDaConta),
      'observacao': serializer.toJson<String?>(observacao),
      'tipo': serializer.toJson<int>(tipo),
      'instituicaoBancaria': serializer.toJson<int>(instituicaoBancaria),
      'dataDeCriacao': serializer.toJson<DateTime>(dataDeCriacao),
    };
  }

  ContaBancaria copyWith(
          {String? id,
          String? idTitularDaConta,
          String? nome,
          int? agencia,
          int? numeroDaConta,
          String? observacao,
          int? tipo,
          int? instituicaoBancaria,
          DateTime? dataDeCriacao}) =>
      ContaBancaria(
        id: id ?? this.id,
        idTitularDaConta: idTitularDaConta ?? this.idTitularDaConta,
        nome: nome ?? this.nome,
        agencia: agencia ?? this.agencia,
        numeroDaConta: numeroDaConta ?? this.numeroDaConta,
        observacao: observacao ?? this.observacao,
        tipo: tipo ?? this.tipo,
        instituicaoBancaria: instituicaoBancaria ?? this.instituicaoBancaria,
        dataDeCriacao: dataDeCriacao ?? this.dataDeCriacao,
      );
  @override
  String toString() {
    return (StringBuffer('ContaBancaria(')
          ..write('id: $id, ')
          ..write('idTitularDaConta: $idTitularDaConta, ')
          ..write('nome: $nome, ')
          ..write('agencia: $agencia, ')
          ..write('numeroDaConta: $numeroDaConta, ')
          ..write('observacao: $observacao, ')
          ..write('tipo: $tipo, ')
          ..write('instituicaoBancaria: $instituicaoBancaria, ')
          ..write('dataDeCriacao: $dataDeCriacao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idTitularDaConta, nome, agencia,
      numeroDaConta, observacao, tipo, instituicaoBancaria, dataDeCriacao);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContaBancaria &&
          other.id == this.id &&
          other.idTitularDaConta == this.idTitularDaConta &&
          other.nome == this.nome &&
          other.agencia == this.agencia &&
          other.numeroDaConta == this.numeroDaConta &&
          other.observacao == this.observacao &&
          other.tipo == this.tipo &&
          other.instituicaoBancaria == this.instituicaoBancaria &&
          other.dataDeCriacao == this.dataDeCriacao);
}

class ContasBancariasCompanion extends UpdateCompanion<ContaBancaria> {
  final Value<String> id;
  final Value<String> idTitularDaConta;
  final Value<String> nome;
  final Value<int> agencia;
  final Value<int> numeroDaConta;
  final Value<String?> observacao;
  final Value<int> tipo;
  final Value<int> instituicaoBancaria;
  final Value<DateTime> dataDeCriacao;
  const ContasBancariasCompanion({
    this.id = const Value.absent(),
    this.idTitularDaConta = const Value.absent(),
    this.nome = const Value.absent(),
    this.agencia = const Value.absent(),
    this.numeroDaConta = const Value.absent(),
    this.observacao = const Value.absent(),
    this.tipo = const Value.absent(),
    this.instituicaoBancaria = const Value.absent(),
    this.dataDeCriacao = const Value.absent(),
  });
  ContasBancariasCompanion.insert({
    required String id,
    required String idTitularDaConta,
    required String nome,
    required int agencia,
    required int numeroDaConta,
    this.observacao = const Value.absent(),
    required int tipo,
    required int instituicaoBancaria,
    this.dataDeCriacao = const Value.absent(),
  })  : id = Value(id),
        idTitularDaConta = Value(idTitularDaConta),
        nome = Value(nome),
        agencia = Value(agencia),
        numeroDaConta = Value(numeroDaConta),
        tipo = Value(tipo),
        instituicaoBancaria = Value(instituicaoBancaria);
  static Insertable<ContaBancaria> custom({
    Expression<String>? id,
    Expression<String>? idTitularDaConta,
    Expression<String>? nome,
    Expression<int>? agencia,
    Expression<int>? numeroDaConta,
    Expression<String?>? observacao,
    Expression<int>? tipo,
    Expression<int>? instituicaoBancaria,
    Expression<DateTime>? dataDeCriacao,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idTitularDaConta != null) 'id_titular_da_conta': idTitularDaConta,
      if (nome != null) 'nome': nome,
      if (agencia != null) 'agencia': agencia,
      if (numeroDaConta != null) 'numero_da_conta': numeroDaConta,
      if (observacao != null) 'observacao': observacao,
      if (tipo != null) 'tipo': tipo,
      if (instituicaoBancaria != null)
        'instituicao_bancaria': instituicaoBancaria,
      if (dataDeCriacao != null) 'data_de_criacao': dataDeCriacao,
    });
  }

  ContasBancariasCompanion copyWith(
      {Value<String>? id,
      Value<String>? idTitularDaConta,
      Value<String>? nome,
      Value<int>? agencia,
      Value<int>? numeroDaConta,
      Value<String?>? observacao,
      Value<int>? tipo,
      Value<int>? instituicaoBancaria,
      Value<DateTime>? dataDeCriacao}) {
    return ContasBancariasCompanion(
      id: id ?? this.id,
      idTitularDaConta: idTitularDaConta ?? this.idTitularDaConta,
      nome: nome ?? this.nome,
      agencia: agencia ?? this.agencia,
      numeroDaConta: numeroDaConta ?? this.numeroDaConta,
      observacao: observacao ?? this.observacao,
      tipo: tipo ?? this.tipo,
      instituicaoBancaria: instituicaoBancaria ?? this.instituicaoBancaria,
      dataDeCriacao: dataDeCriacao ?? this.dataDeCriacao,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (idTitularDaConta.present) {
      map['id_titular_da_conta'] = Variable<String>(idTitularDaConta.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (agencia.present) {
      map['agencia'] = Variable<int>(agencia.value);
    }
    if (numeroDaConta.present) {
      map['numero_da_conta'] = Variable<int>(numeroDaConta.value);
    }
    if (observacao.present) {
      map['observacao'] = Variable<String?>(observacao.value);
    }
    if (tipo.present) {
      map['tipo'] = Variable<int>(tipo.value);
    }
    if (instituicaoBancaria.present) {
      map['instituicao_bancaria'] = Variable<int>(instituicaoBancaria.value);
    }
    if (dataDeCriacao.present) {
      map['data_de_criacao'] = Variable<DateTime>(dataDeCriacao.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContasBancariasCompanion(')
          ..write('id: $id, ')
          ..write('idTitularDaConta: $idTitularDaConta, ')
          ..write('nome: $nome, ')
          ..write('agencia: $agencia, ')
          ..write('numeroDaConta: $numeroDaConta, ')
          ..write('observacao: $observacao, ')
          ..write('tipo: $tipo, ')
          ..write('instituicaoBancaria: $instituicaoBancaria, ')
          ..write('dataDeCriacao: $dataDeCriacao')
          ..write(')'))
        .toString();
  }
}

class $ContasBancariasTable extends ContasBancarias
    with TableInfo<$ContasBancariasTable, ContaBancaria> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ContasBancariasTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _idTitularDaContaMeta =
      const VerificationMeta('idTitularDaConta');
  @override
  late final GeneratedColumn<String?> idTitularDaConta =
      GeneratedColumn<String?>('id_titular_da_conta', aliasedName, false,
          type: const StringType(),
          requiredDuringInsert: true,
          defaultConstraints: 'REFERENCES pessoas (id)');
  final VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String?> nome = GeneratedColumn<String?>(
      'nome', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _agenciaMeta = const VerificationMeta('agencia');
  @override
  late final GeneratedColumn<int?> agencia = GeneratedColumn<int?>(
      'agencia', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _numeroDaContaMeta =
      const VerificationMeta('numeroDaConta');
  @override
  late final GeneratedColumn<int?> numeroDaConta = GeneratedColumn<int?>(
      'numero_da_conta', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _observacaoMeta = const VerificationMeta('observacao');
  @override
  late final GeneratedColumn<String?> observacao = GeneratedColumn<String?>(
      'observacao', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _tipoMeta = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<int?> tipo = GeneratedColumn<int?>(
      'tipo', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _instituicaoBancariaMeta =
      const VerificationMeta('instituicaoBancaria');
  @override
  late final GeneratedColumn<int?> instituicaoBancaria = GeneratedColumn<int?>(
      'instituicao_bancaria', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _dataDeCriacaoMeta =
      const VerificationMeta('dataDeCriacao');
  @override
  late final GeneratedColumn<DateTime?> dataDeCriacao =
      GeneratedColumn<DateTime?>('data_de_criacao', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idTitularDaConta,
        nome,
        agencia,
        numeroDaConta,
        observacao,
        tipo,
        instituicaoBancaria,
        dataDeCriacao
      ];
  @override
  String get aliasedName => _alias ?? 'contas_bancarias';
  @override
  String get actualTableName => 'contas_bancarias';
  @override
  VerificationContext validateIntegrity(Insertable<ContaBancaria> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('id_titular_da_conta')) {
      context.handle(
          _idTitularDaContaMeta,
          idTitularDaConta.isAcceptableOrUnknown(
              data['id_titular_da_conta']!, _idTitularDaContaMeta));
    } else if (isInserting) {
      context.missing(_idTitularDaContaMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('agencia')) {
      context.handle(_agenciaMeta,
          agencia.isAcceptableOrUnknown(data['agencia']!, _agenciaMeta));
    } else if (isInserting) {
      context.missing(_agenciaMeta);
    }
    if (data.containsKey('numero_da_conta')) {
      context.handle(
          _numeroDaContaMeta,
          numeroDaConta.isAcceptableOrUnknown(
              data['numero_da_conta']!, _numeroDaContaMeta));
    } else if (isInserting) {
      context.missing(_numeroDaContaMeta);
    }
    if (data.containsKey('observacao')) {
      context.handle(
          _observacaoMeta,
          observacao.isAcceptableOrUnknown(
              data['observacao']!, _observacaoMeta));
    }
    if (data.containsKey('tipo')) {
      context.handle(
          _tipoMeta, tipo.isAcceptableOrUnknown(data['tipo']!, _tipoMeta));
    } else if (isInserting) {
      context.missing(_tipoMeta);
    }
    if (data.containsKey('instituicao_bancaria')) {
      context.handle(
          _instituicaoBancariaMeta,
          instituicaoBancaria.isAcceptableOrUnknown(
              data['instituicao_bancaria']!, _instituicaoBancariaMeta));
    } else if (isInserting) {
      context.missing(_instituicaoBancariaMeta);
    }
    if (data.containsKey('data_de_criacao')) {
      context.handle(
          _dataDeCriacaoMeta,
          dataDeCriacao.isAcceptableOrUnknown(
              data['data_de_criacao']!, _dataDeCriacaoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ContaBancaria map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ContaBancaria.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ContasBancariasTable createAlias(String alias) {
    return $ContasBancariasTable(_db, alias);
  }
}

class Despesa extends DataClass implements Insertable<Despesa> {
  final String id;
  final String? idContaBancaria;
  final String? idComprovante;
  final String nome;
  final double valorTotal;
  final int formaDePagamento;
  final String chavePix;
  final int obrigarComprovante;
  final String? observacoes;
  final DateTime dataDeCriacao;
  Despesa(
      {required this.id,
      this.idContaBancaria,
      this.idComprovante,
      required this.nome,
      required this.valorTotal,
      required this.formaDePagamento,
      required this.chavePix,
      required this.obrigarComprovante,
      this.observacoes,
      required this.dataDeCriacao});
  factory Despesa.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Despesa(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idContaBancaria: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_conta_bancaria']),
      idComprovante: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_comprovante']),
      nome: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nome'])!,
      valorTotal: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}valor_total'])!,
      formaDePagamento: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}forma_de_pagamento'])!,
      chavePix: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chave_pix'])!,
      obrigarComprovante: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}obrigar_comprovante'])!,
      observacoes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}observacoes']),
      dataDeCriacao: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}data_de_criacao'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || idContaBancaria != null) {
      map['id_conta_bancaria'] = Variable<String?>(idContaBancaria);
    }
    if (!nullToAbsent || idComprovante != null) {
      map['id_comprovante'] = Variable<String?>(idComprovante);
    }
    map['nome'] = Variable<String>(nome);
    map['valor_total'] = Variable<double>(valorTotal);
    map['forma_de_pagamento'] = Variable<int>(formaDePagamento);
    map['chave_pix'] = Variable<String>(chavePix);
    map['obrigar_comprovante'] = Variable<int>(obrigarComprovante);
    if (!nullToAbsent || observacoes != null) {
      map['observacoes'] = Variable<String?>(observacoes);
    }
    map['data_de_criacao'] = Variable<DateTime>(dataDeCriacao);
    return map;
  }

  DespesasCompanion toCompanion(bool nullToAbsent) {
    return DespesasCompanion(
      id: Value(id),
      idContaBancaria: idContaBancaria == null && nullToAbsent
          ? const Value.absent()
          : Value(idContaBancaria),
      idComprovante: idComprovante == null && nullToAbsent
          ? const Value.absent()
          : Value(idComprovante),
      nome: Value(nome),
      valorTotal: Value(valorTotal),
      formaDePagamento: Value(formaDePagamento),
      chavePix: Value(chavePix),
      obrigarComprovante: Value(obrigarComprovante),
      observacoes: observacoes == null && nullToAbsent
          ? const Value.absent()
          : Value(observacoes),
      dataDeCriacao: Value(dataDeCriacao),
    );
  }

  factory Despesa.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Despesa(
      id: serializer.fromJson<String>(json['id']),
      idContaBancaria: serializer.fromJson<String?>(json['idContaBancaria']),
      idComprovante: serializer.fromJson<String?>(json['idComprovante']),
      nome: serializer.fromJson<String>(json['nome']),
      valorTotal: serializer.fromJson<double>(json['valorTotal']),
      formaDePagamento: serializer.fromJson<int>(json['formaDePagamento']),
      chavePix: serializer.fromJson<String>(json['chavePix']),
      obrigarComprovante: serializer.fromJson<int>(json['obrigarComprovante']),
      observacoes: serializer.fromJson<String?>(json['observacoes']),
      dataDeCriacao: serializer.fromJson<DateTime>(json['dataDeCriacao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'idContaBancaria': serializer.toJson<String?>(idContaBancaria),
      'idComprovante': serializer.toJson<String?>(idComprovante),
      'nome': serializer.toJson<String>(nome),
      'valorTotal': serializer.toJson<double>(valorTotal),
      'formaDePagamento': serializer.toJson<int>(formaDePagamento),
      'chavePix': serializer.toJson<String>(chavePix),
      'obrigarComprovante': serializer.toJson<int>(obrigarComprovante),
      'observacoes': serializer.toJson<String?>(observacoes),
      'dataDeCriacao': serializer.toJson<DateTime>(dataDeCriacao),
    };
  }

  Despesa copyWith(
          {String? id,
          String? idContaBancaria,
          String? idComprovante,
          String? nome,
          double? valorTotal,
          int? formaDePagamento,
          String? chavePix,
          int? obrigarComprovante,
          String? observacoes,
          DateTime? dataDeCriacao}) =>
      Despesa(
        id: id ?? this.id,
        idContaBancaria: idContaBancaria ?? this.idContaBancaria,
        idComprovante: idComprovante ?? this.idComprovante,
        nome: nome ?? this.nome,
        valorTotal: valorTotal ?? this.valorTotal,
        formaDePagamento: formaDePagamento ?? this.formaDePagamento,
        chavePix: chavePix ?? this.chavePix,
        obrigarComprovante: obrigarComprovante ?? this.obrigarComprovante,
        observacoes: observacoes ?? this.observacoes,
        dataDeCriacao: dataDeCriacao ?? this.dataDeCriacao,
      );
  @override
  String toString() {
    return (StringBuffer('Despesa(')
          ..write('id: $id, ')
          ..write('idContaBancaria: $idContaBancaria, ')
          ..write('idComprovante: $idComprovante, ')
          ..write('nome: $nome, ')
          ..write('valorTotal: $valorTotal, ')
          ..write('formaDePagamento: $formaDePagamento, ')
          ..write('chavePix: $chavePix, ')
          ..write('obrigarComprovante: $obrigarComprovante, ')
          ..write('observacoes: $observacoes, ')
          ..write('dataDeCriacao: $dataDeCriacao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      idContaBancaria,
      idComprovante,
      nome,
      valorTotal,
      formaDePagamento,
      chavePix,
      obrigarComprovante,
      observacoes,
      dataDeCriacao);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Despesa &&
          other.id == this.id &&
          other.idContaBancaria == this.idContaBancaria &&
          other.idComprovante == this.idComprovante &&
          other.nome == this.nome &&
          other.valorTotal == this.valorTotal &&
          other.formaDePagamento == this.formaDePagamento &&
          other.chavePix == this.chavePix &&
          other.obrigarComprovante == this.obrigarComprovante &&
          other.observacoes == this.observacoes &&
          other.dataDeCriacao == this.dataDeCriacao);
}

class DespesasCompanion extends UpdateCompanion<Despesa> {
  final Value<String> id;
  final Value<String?> idContaBancaria;
  final Value<String?> idComprovante;
  final Value<String> nome;
  final Value<double> valorTotal;
  final Value<int> formaDePagamento;
  final Value<String> chavePix;
  final Value<int> obrigarComprovante;
  final Value<String?> observacoes;
  final Value<DateTime> dataDeCriacao;
  const DespesasCompanion({
    this.id = const Value.absent(),
    this.idContaBancaria = const Value.absent(),
    this.idComprovante = const Value.absent(),
    this.nome = const Value.absent(),
    this.valorTotal = const Value.absent(),
    this.formaDePagamento = const Value.absent(),
    this.chavePix = const Value.absent(),
    this.obrigarComprovante = const Value.absent(),
    this.observacoes = const Value.absent(),
    this.dataDeCriacao = const Value.absent(),
  });
  DespesasCompanion.insert({
    required String id,
    this.idContaBancaria = const Value.absent(),
    this.idComprovante = const Value.absent(),
    required String nome,
    required double valorTotal,
    required int formaDePagamento,
    required String chavePix,
    required int obrigarComprovante,
    this.observacoes = const Value.absent(),
    this.dataDeCriacao = const Value.absent(),
  })  : id = Value(id),
        nome = Value(nome),
        valorTotal = Value(valorTotal),
        formaDePagamento = Value(formaDePagamento),
        chavePix = Value(chavePix),
        obrigarComprovante = Value(obrigarComprovante);
  static Insertable<Despesa> custom({
    Expression<String>? id,
    Expression<String?>? idContaBancaria,
    Expression<String?>? idComprovante,
    Expression<String>? nome,
    Expression<double>? valorTotal,
    Expression<int>? formaDePagamento,
    Expression<String>? chavePix,
    Expression<int>? obrigarComprovante,
    Expression<String?>? observacoes,
    Expression<DateTime>? dataDeCriacao,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idContaBancaria != null) 'id_conta_bancaria': idContaBancaria,
      if (idComprovante != null) 'id_comprovante': idComprovante,
      if (nome != null) 'nome': nome,
      if (valorTotal != null) 'valor_total': valorTotal,
      if (formaDePagamento != null) 'forma_de_pagamento': formaDePagamento,
      if (chavePix != null) 'chave_pix': chavePix,
      if (obrigarComprovante != null) 'obrigar_comprovante': obrigarComprovante,
      if (observacoes != null) 'observacoes': observacoes,
      if (dataDeCriacao != null) 'data_de_criacao': dataDeCriacao,
    });
  }

  DespesasCompanion copyWith(
      {Value<String>? id,
      Value<String?>? idContaBancaria,
      Value<String?>? idComprovante,
      Value<String>? nome,
      Value<double>? valorTotal,
      Value<int>? formaDePagamento,
      Value<String>? chavePix,
      Value<int>? obrigarComprovante,
      Value<String?>? observacoes,
      Value<DateTime>? dataDeCriacao}) {
    return DespesasCompanion(
      id: id ?? this.id,
      idContaBancaria: idContaBancaria ?? this.idContaBancaria,
      idComprovante: idComprovante ?? this.idComprovante,
      nome: nome ?? this.nome,
      valorTotal: valorTotal ?? this.valorTotal,
      formaDePagamento: formaDePagamento ?? this.formaDePagamento,
      chavePix: chavePix ?? this.chavePix,
      obrigarComprovante: obrigarComprovante ?? this.obrigarComprovante,
      observacoes: observacoes ?? this.observacoes,
      dataDeCriacao: dataDeCriacao ?? this.dataDeCriacao,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (idContaBancaria.present) {
      map['id_conta_bancaria'] = Variable<String?>(idContaBancaria.value);
    }
    if (idComprovante.present) {
      map['id_comprovante'] = Variable<String?>(idComprovante.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (valorTotal.present) {
      map['valor_total'] = Variable<double>(valorTotal.value);
    }
    if (formaDePagamento.present) {
      map['forma_de_pagamento'] = Variable<int>(formaDePagamento.value);
    }
    if (chavePix.present) {
      map['chave_pix'] = Variable<String>(chavePix.value);
    }
    if (obrigarComprovante.present) {
      map['obrigar_comprovante'] = Variable<int>(obrigarComprovante.value);
    }
    if (observacoes.present) {
      map['observacoes'] = Variable<String?>(observacoes.value);
    }
    if (dataDeCriacao.present) {
      map['data_de_criacao'] = Variable<DateTime>(dataDeCriacao.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DespesasCompanion(')
          ..write('id: $id, ')
          ..write('idContaBancaria: $idContaBancaria, ')
          ..write('idComprovante: $idComprovante, ')
          ..write('nome: $nome, ')
          ..write('valorTotal: $valorTotal, ')
          ..write('formaDePagamento: $formaDePagamento, ')
          ..write('chavePix: $chavePix, ')
          ..write('obrigarComprovante: $obrigarComprovante, ')
          ..write('observacoes: $observacoes, ')
          ..write('dataDeCriacao: $dataDeCriacao')
          ..write(')'))
        .toString();
  }
}

class $DespesasTable extends Despesas with TableInfo<$DespesasTable, Despesa> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DespesasTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _idContaBancariaMeta =
      const VerificationMeta('idContaBancaria');
  @override
  late final GeneratedColumn<String?> idContaBancaria =
      GeneratedColumn<String?>('id_conta_bancaria', aliasedName, true,
          type: const StringType(),
          requiredDuringInsert: false,
          defaultConstraints: 'REFERENCES contas_bancarias (id)');
  final VerificationMeta _idComprovanteMeta =
      const VerificationMeta('idComprovante');
  @override
  late final GeneratedColumn<String?> idComprovante = GeneratedColumn<String?>(
      'id_comprovante', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultConstraints: 'REFERENCES comprovantes (id)');
  final VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String?> nome = GeneratedColumn<String?>(
      'nome', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _valorTotalMeta = const VerificationMeta('valorTotal');
  @override
  late final GeneratedColumn<double?> valorTotal = GeneratedColumn<double?>(
      'valor_total', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _formaDePagamentoMeta =
      const VerificationMeta('formaDePagamento');
  @override
  late final GeneratedColumn<int?> formaDePagamento = GeneratedColumn<int?>(
      'forma_de_pagamento', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _chavePixMeta = const VerificationMeta('chavePix');
  @override
  late final GeneratedColumn<String?> chavePix = GeneratedColumn<String?>(
      'chave_pix', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _obrigarComprovanteMeta =
      const VerificationMeta('obrigarComprovante');
  @override
  late final GeneratedColumn<int?> obrigarComprovante = GeneratedColumn<int?>(
      'obrigar_comprovante', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _observacoesMeta =
      const VerificationMeta('observacoes');
  @override
  late final GeneratedColumn<String?> observacoes = GeneratedColumn<String?>(
      'observacoes', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _dataDeCriacaoMeta =
      const VerificationMeta('dataDeCriacao');
  @override
  late final GeneratedColumn<DateTime?> dataDeCriacao =
      GeneratedColumn<DateTime?>('data_de_criacao', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idContaBancaria,
        idComprovante,
        nome,
        valorTotal,
        formaDePagamento,
        chavePix,
        obrigarComprovante,
        observacoes,
        dataDeCriacao
      ];
  @override
  String get aliasedName => _alias ?? 'despesas';
  @override
  String get actualTableName => 'despesas';
  @override
  VerificationContext validateIntegrity(Insertable<Despesa> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('id_conta_bancaria')) {
      context.handle(
          _idContaBancariaMeta,
          idContaBancaria.isAcceptableOrUnknown(
              data['id_conta_bancaria']!, _idContaBancariaMeta));
    }
    if (data.containsKey('id_comprovante')) {
      context.handle(
          _idComprovanteMeta,
          idComprovante.isAcceptableOrUnknown(
              data['id_comprovante']!, _idComprovanteMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('valor_total')) {
      context.handle(
          _valorTotalMeta,
          valorTotal.isAcceptableOrUnknown(
              data['valor_total']!, _valorTotalMeta));
    } else if (isInserting) {
      context.missing(_valorTotalMeta);
    }
    if (data.containsKey('forma_de_pagamento')) {
      context.handle(
          _formaDePagamentoMeta,
          formaDePagamento.isAcceptableOrUnknown(
              data['forma_de_pagamento']!, _formaDePagamentoMeta));
    } else if (isInserting) {
      context.missing(_formaDePagamentoMeta);
    }
    if (data.containsKey('chave_pix')) {
      context.handle(_chavePixMeta,
          chavePix.isAcceptableOrUnknown(data['chave_pix']!, _chavePixMeta));
    } else if (isInserting) {
      context.missing(_chavePixMeta);
    }
    if (data.containsKey('obrigar_comprovante')) {
      context.handle(
          _obrigarComprovanteMeta,
          obrigarComprovante.isAcceptableOrUnknown(
              data['obrigar_comprovante']!, _obrigarComprovanteMeta));
    } else if (isInserting) {
      context.missing(_obrigarComprovanteMeta);
    }
    if (data.containsKey('observacoes')) {
      context.handle(
          _observacoesMeta,
          observacoes.isAcceptableOrUnknown(
              data['observacoes']!, _observacoesMeta));
    }
    if (data.containsKey('data_de_criacao')) {
      context.handle(
          _dataDeCriacaoMeta,
          dataDeCriacao.isAcceptableOrUnknown(
              data['data_de_criacao']!, _dataDeCriacaoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Despesa map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Despesa.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DespesasTable createAlias(String alias) {
    return $DespesasTable(_db, alias);
  }
}

class ParticipanteDaDespesa extends DataClass
    implements Insertable<ParticipanteDaDespesa> {
  final String idPessoa;
  final double valorASerPago;
  final DateTime dataDeCriacao;
  ParticipanteDaDespesa(
      {required this.idPessoa,
      required this.valorASerPago,
      required this.dataDeCriacao});
  factory ParticipanteDaDespesa.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ParticipanteDaDespesa(
      idPessoa: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_pessoa'])!,
      valorASerPago: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}valor_a_ser_pago'])!,
      dataDeCriacao: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}data_de_criacao'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_pessoa'] = Variable<String>(idPessoa);
    map['valor_a_ser_pago'] = Variable<double>(valorASerPago);
    map['data_de_criacao'] = Variable<DateTime>(dataDeCriacao);
    return map;
  }

  ParticipantesDaDespesaCompanion toCompanion(bool nullToAbsent) {
    return ParticipantesDaDespesaCompanion(
      idPessoa: Value(idPessoa),
      valorASerPago: Value(valorASerPago),
      dataDeCriacao: Value(dataDeCriacao),
    );
  }

  factory ParticipanteDaDespesa.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ParticipanteDaDespesa(
      idPessoa: serializer.fromJson<String>(json['idPessoa']),
      valorASerPago: serializer.fromJson<double>(json['valorASerPago']),
      dataDeCriacao: serializer.fromJson<DateTime>(json['dataDeCriacao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idPessoa': serializer.toJson<String>(idPessoa),
      'valorASerPago': serializer.toJson<double>(valorASerPago),
      'dataDeCriacao': serializer.toJson<DateTime>(dataDeCriacao),
    };
  }

  ParticipanteDaDespesa copyWith(
          {String? idPessoa, double? valorASerPago, DateTime? dataDeCriacao}) =>
      ParticipanteDaDespesa(
        idPessoa: idPessoa ?? this.idPessoa,
        valorASerPago: valorASerPago ?? this.valorASerPago,
        dataDeCriacao: dataDeCriacao ?? this.dataDeCriacao,
      );
  @override
  String toString() {
    return (StringBuffer('ParticipanteDaDespesa(')
          ..write('idPessoa: $idPessoa, ')
          ..write('valorASerPago: $valorASerPago, ')
          ..write('dataDeCriacao: $dataDeCriacao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idPessoa, valorASerPago, dataDeCriacao);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParticipanteDaDespesa &&
          other.idPessoa == this.idPessoa &&
          other.valorASerPago == this.valorASerPago &&
          other.dataDeCriacao == this.dataDeCriacao);
}

class ParticipantesDaDespesaCompanion
    extends UpdateCompanion<ParticipanteDaDespesa> {
  final Value<String> idPessoa;
  final Value<double> valorASerPago;
  final Value<DateTime> dataDeCriacao;
  const ParticipantesDaDespesaCompanion({
    this.idPessoa = const Value.absent(),
    this.valorASerPago = const Value.absent(),
    this.dataDeCriacao = const Value.absent(),
  });
  ParticipantesDaDespesaCompanion.insert({
    required String idPessoa,
    required double valorASerPago,
    this.dataDeCriacao = const Value.absent(),
  })  : idPessoa = Value(idPessoa),
        valorASerPago = Value(valorASerPago);
  static Insertable<ParticipanteDaDespesa> custom({
    Expression<String>? idPessoa,
    Expression<double>? valorASerPago,
    Expression<DateTime>? dataDeCriacao,
  }) {
    return RawValuesInsertable({
      if (idPessoa != null) 'id_pessoa': idPessoa,
      if (valorASerPago != null) 'valor_a_ser_pago': valorASerPago,
      if (dataDeCriacao != null) 'data_de_criacao': dataDeCriacao,
    });
  }

  ParticipantesDaDespesaCompanion copyWith(
      {Value<String>? idPessoa,
      Value<double>? valorASerPago,
      Value<DateTime>? dataDeCriacao}) {
    return ParticipantesDaDespesaCompanion(
      idPessoa: idPessoa ?? this.idPessoa,
      valorASerPago: valorASerPago ?? this.valorASerPago,
      dataDeCriacao: dataDeCriacao ?? this.dataDeCriacao,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idPessoa.present) {
      map['id_pessoa'] = Variable<String>(idPessoa.value);
    }
    if (valorASerPago.present) {
      map['valor_a_ser_pago'] = Variable<double>(valorASerPago.value);
    }
    if (dataDeCriacao.present) {
      map['data_de_criacao'] = Variable<DateTime>(dataDeCriacao.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParticipantesDaDespesaCompanion(')
          ..write('idPessoa: $idPessoa, ')
          ..write('valorASerPago: $valorASerPago, ')
          ..write('dataDeCriacao: $dataDeCriacao')
          ..write(')'))
        .toString();
  }
}

class $ParticipantesDaDespesaTable extends ParticipantesDaDespesa
    with TableInfo<$ParticipantesDaDespesaTable, ParticipanteDaDespesa> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ParticipantesDaDespesaTable(this._db, [this._alias]);
  final VerificationMeta _idPessoaMeta = const VerificationMeta('idPessoa');
  @override
  late final GeneratedColumn<String?> idPessoa = GeneratedColumn<String?>(
      'id_pessoa', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES pessoas (id)');
  final VerificationMeta _valorASerPagoMeta =
      const VerificationMeta('valorASerPago');
  @override
  late final GeneratedColumn<double?> valorASerPago = GeneratedColumn<double?>(
      'valor_a_ser_pago', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _dataDeCriacaoMeta =
      const VerificationMeta('dataDeCriacao');
  @override
  late final GeneratedColumn<DateTime?> dataDeCriacao =
      GeneratedColumn<DateTime?>('data_de_criacao', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns =>
      [idPessoa, valorASerPago, dataDeCriacao];
  @override
  String get aliasedName => _alias ?? 'participantes_da_despesa';
  @override
  String get actualTableName => 'participantes_da_despesa';
  @override
  VerificationContext validateIntegrity(
      Insertable<ParticipanteDaDespesa> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_pessoa')) {
      context.handle(_idPessoaMeta,
          idPessoa.isAcceptableOrUnknown(data['id_pessoa']!, _idPessoaMeta));
    } else if (isInserting) {
      context.missing(_idPessoaMeta);
    }
    if (data.containsKey('valor_a_ser_pago')) {
      context.handle(
          _valorASerPagoMeta,
          valorASerPago.isAcceptableOrUnknown(
              data['valor_a_ser_pago']!, _valorASerPagoMeta));
    } else if (isInserting) {
      context.missing(_valorASerPagoMeta);
    }
    if (data.containsKey('data_de_criacao')) {
      context.handle(
          _dataDeCriacaoMeta,
          dataDeCriacao.isAcceptableOrUnknown(
              data['data_de_criacao']!, _dataDeCriacaoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ParticipanteDaDespesa map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ParticipanteDaDespesa.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ParticipantesDaDespesaTable createAlias(String alias) {
    return $ParticipantesDaDespesaTable(_db, alias);
  }
}

abstract class _$DriftSqliteDatabase extends GeneratedDatabase {
  _$DriftSqliteDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $ComprovantesTable comprovantes = $ComprovantesTable(this);
  late final $PessoasTable pessoas = $PessoasTable(this);
  late final $ContasBancariasTable contasBancarias =
      $ContasBancariasTable(this);
  late final $DespesasTable despesas = $DespesasTable(this);
  late final $ParticipantesDaDespesaTable participantesDaDespesa =
      $ParticipantesDaDespesaTable(this);
  late final PessoasDao pessoasDao = PessoasDao(this as DriftSqliteDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        comprovantes,
        pessoas,
        contasBancarias,
        despesas,
        participantesDaDespesa
      ];
}
