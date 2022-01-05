import 'package:interapay/Layers/Dominio/Entidades/Comuns/ParticipanteDaDespesa.dart';
import 'package:interapay/Layers/Dominio/Entidades/Comuns/Pessoa.dart';
import 'package:interapay/Layers/Dominio/Enums/Financas/TipoDePessoa.dart';
import 'package:test/test.dart';

main() {
  final PessoaEntity pessoa = PessoaEntity(
    cpfCnpj: '428.379.635-26',
    nome: 'Teste',
    email: 'teste@email.com',
    telefone: '(21) 98359-7649',
    tipoDePessoa: TipoDePessoa.Fisica,
  );

  ParticipanteDaDespesaEntity participanteDaDespesa = ParticipanteDaDespesaEntity(
    pessoa: pessoa,
    valorASerPago: 200,
  );
  
  test('Deve retornar um erro caso valor a ser pago for menor ou igual a zero', () {
    participanteDaDespesa.valorASerPago = 0.0;

    expect(participanteDaDespesa.validar().valido, false);
  });

  test('Deve retornar sucesso caso valor a ser pago for maior que zero', () {
    participanteDaDespesa.valorASerPago = 300.0;

    expect(participanteDaDespesa.validar().valido, true);
  });
}
