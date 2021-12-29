import 'package:test/test.dart';
import 'package:juntapay/Core/Helpers/JuntaUtils.dart';

void main() {
  test('Deve retornar true caso e-mail for válido', () {
    String email = 'teste@email.com';

    expect(JuntaPayUtils.isValidEmail(email), true);

    email = 'testestes2@csdad';

    expect(JuntaPayUtils.isValidEmail(email), false);
  });

  test('Deve retornar true caso CPF for válido', () {
    String cpf = '428.379.635-26';

    expect(JuntaPayUtils.isValidCPF(cpf), true);

    cpf = '42837963526';

    expect(JuntaPayUtils.isValidCPF(cpf), true);

    cpf = '000000000000000';

    expect(JuntaPayUtils.isValidCPF(cpf), false);
  });
  test('Deve retornar true caso CNPJ for válido', () {
    String cnpj = '08.974.023/0001-09';

    expect(JuntaPayUtils.isValidCNPJ(cnpj), true);

    cnpj = '08974023000109';

    expect(JuntaPayUtils.isValidCNPJ(cnpj), true);

    cnpj = '08974023000109921361712';

    expect(JuntaPayUtils.isValidCNPJ(cnpj), false);
  });
  test('Deve retornar true caso CPF ou CNPJ for válido', () {
    String cpfCnpj = '428.379.635-26';

    expect(JuntaPayUtils.isValidCpfCnpj(cpfCnpj), true);

    cpfCnpj = '08.974.023/0001-09';

    expect(JuntaPayUtils.isValidCpfCnpj(cpfCnpj), true);

    cpfCnpj = '232131312311231';

    expect(JuntaPayUtils.isValidCpfCnpj(cpfCnpj), false);
  });
  test('Deve retornar true caso String não for vazia', () {
    String? value = 'teste';

    expect(JuntaPayUtils.isNotEmpty(value), true);

    value = '';

    expect(JuntaPayUtils.isNotEmpty(value), false);

    value = null;

    expect(JuntaPayUtils.isNotEmpty(value), false);
  });
  test('Deve retornar o CPF formatado caso CPF for válido', () {
    String cpf = '42837963526';

    expect(JuntaPayUtils.formatarCpf(cpf), '428.379.635-26');

    cpf = '1923718931278321731283';

    expect(() => JuntaPayUtils.formatarCpf(cpf), throwsA(isA<AssertionError>()));
  });
  test('Deve retornar o CNPJ formatado caso CNPJ for válido', () {
    String cnpj = '08974023000109';

    expect(JuntaPayUtils.formatarCnpj(cnpj), '08.974.023/0001-09');

    cnpj = '1923718931278321731283';

    expect(() => JuntaPayUtils.formatarCnpj(cnpj), throwsA(isA<AssertionError>()));
  });
   test('Deve retornar o CPF/CNPJ formatado caso CPF/CNPJ for válido', () {
    String cpfCnpj = '42837963526';

    expect(JuntaPayUtils.formatarCpfCnpj(cpfCnpj), '428.379.635-26');

    cpfCnpj = '08974023000109';

    expect(JuntaPayUtils.formatarCpfCnpj(cpfCnpj), '08.974.023/0001-09');

    cpfCnpj = '1923718931278321731283';

    expect(() => JuntaPayUtils.formatarCnpj(cpfCnpj), throwsA(isA<AssertionError>()));
  });
}
