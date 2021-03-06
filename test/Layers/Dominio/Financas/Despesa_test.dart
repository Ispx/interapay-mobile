import 'package:get/get.dart';
import 'package:juntapay/Core/Services/LocalStorage/ILocalStorageService.dart';
import 'package:juntapay/Core/Services/LocalStorage/SharedPreferencesLocalStorageService.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

import 'package:juntapay/Layers/Dominio/Entidades/Financas/ContaBancaria.dart';
import 'package:juntapay/Layers/Dominio/Entidades/Financas/InstituicaoBancaria.dart';
import 'package:juntapay/Layers/Dominio/Enums/Financas/FormaDePagamento.dart';
import 'package:juntapay/Layers/Dominio/Enums/Financas/TipoDeContaBancaria.dart';
import 'package:juntapay/Core/Configuracoes.dart';
import 'package:juntapay/Layers/Dominio/Entidades/Comuns/ParticipanteDaDespesa.dart';
import 'package:juntapay/Layers/Dominio/Entidades/Comuns/Pessoa.dart';
import 'package:juntapay/Layers/Dominio/Enums/Financas/TipoDePessoa.dart';
import 'package:juntapay/Layers/Dominio/Entidades/Financas/Despesa.dart';

void main() {
  List<ParticipanteDaDespesaEntity> gerarAmigos() {
    return List.generate(
      5,
      (i) => ParticipanteDaDespesaEntity(
        pessoa: PessoaEntity(cpfCnpj: '', nome: 'Amigo $i', tipoDePessoa: TipoDePessoa.Fisica),
        valorASerPago: 100,
      ),
    );
  }

  final ContaBancariaEntity contaBancaria = ContaBancariaEntity(
    agencia: 0,
    instituicaoBancaria: InstituicaoBancariaEntity(nome: 'Teste'),
    nome: 'Nome',
    numeroDaConta: 000,
    tipo: TipoDeContaBancaria.Corrente,
    titularDaConta: PessoaEntity(
      cpfCnpj: '',
      nome: 'Titular da Conta',
      tipoDePessoa: TipoDePessoa.Fisica,
    ),
  );

  final DespesaEntity despesa = DespesaEntity(
    valorTotal: 500.0,
    comprovante: 'teste',
    chavePix: 'chavePix',
    contaBancaria: contaBancaria,
    formaDePagamento: FormaDePagamento.Pix,
    obrigarComprovante: true,
    amigos: gerarAmigos(),
  );

  void resetarDespesa() {
    despesa.valorTotal = 500.0;
    despesa.comprovante = 'teste';
    despesa.chavePix = 'chavePix';
    despesa.contaBancaria = contaBancaria;
    despesa.formaDePagamento = FormaDePagamento.Pix;
    despesa.obrigarComprovante = true;
    despesa.amigos.clear();
    despesa.adicionarAmigos(gerarAmigos());
  }

  setUpAll(() async {
    
    PackageInfo.setMockInitialValues(
      appName: "JuntaPay",
      buildNumber: "1",
      packageName: "com.juntapay.juntapay",
      version: "1.0.0",
      buildSignature: "7A28888B19540485158F55FE53879A86101770AE",
    );
    
    SharedPreferences.setMockInitialValues({});
    var sharedPreferences = await SharedPreferences.getInstance();
    await Get.putAsync<ILocalStorageService>(() async => SharedPreferencesLocalStorageService(sharedPreferences));

    await Configuracoes.init();
  });

  test('Deve retornar um erro caso tenha menos de 1 amigo', () {
    despesa.amigos.removeRange(0, 4);

    var validacao = despesa.validar();

    expect(validacao.valido, false);
  });
  test('Deve retornar um erro caso tenha mais de 5 amigos e n??o tenha assinatura paga', () {
    var validacao = despesa.validar();

    expect(validacao.valido, false);
  });
  test('Deve retornar um erro caso o valor a ser pago dos amigos seja igual a zero', () {
    despesa.amigos[0].valorASerPago = 0.0;

    var validacao = despesa.validar();

    expect(validacao.valido, false);
  });

  test('Deve retornar um erro caso o valor total seja igual a zero', () {
    despesa.valorTotal = 0.0;

    var validacao = despesa.validar();

    expect(validacao.valido, false);
  });

  test('Deve retornar um erro caso a forma de pagamento for PIX e n??o tiver informado a chave PIX', () {
    despesa.chavePix = '';

    var validacao = despesa.validar();

    despesa.chavePix = null;

    var validacao2 = despesa.validar();

    expect(validacao.valido, false);
    expect(validacao2.valido, false);
  });

  test('Deve retornar um erro caso a forma de pagamento for Transfer??ncia Banc??ria e n??o tiver informado a conta banc??ria', () {
    despesa.formaDePagamento = FormaDePagamento.TransferenciaBancaria;
    despesa.contaBancaria = null;

    var validacao = despesa.validar();

    expect(validacao.valido, false);
  });

  test('Deve retornar um erro caso for obrigat??rio comprovante e n??o tiver comprovante', () {
    resetarDespesa();
    despesa.comprovante = null;

    var validacao = despesa.validar();

    expect(validacao.valido, false);

    despesa.formaDePagamento = FormaDePagamento.Dinheiro;

    validacao = despesa.validar();

    expect(validacao.valido, true);
  });
}
