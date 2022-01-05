import 'package:test/test.dart';
import 'package:interapay/Core/Helpers/InteraPayUtils.dart';

void main() {
  test('Deve retornar true caso e-mail for válido', () {
    String email = 'teste@email.com';

    expect(InteraPayUtils.isValidEmail(email), true);

    email = 'testestes2@csdad';

    expect(InteraPayUtils.isValidEmail(email), false);
  });

  test('Deve retornar true caso CPF for válido', () {
    String cpf = '428.379.635-26';

    expect(InteraPayUtils.isValidCPF(cpf), true);

    cpf = '42837963526';

    expect(InteraPayUtils.isValidCPF(cpf), true);

    cpf = '000000000000000';

    expect(InteraPayUtils.isValidCPF(cpf), false);
  });
  test('Deve retornar true caso CNPJ for válido', () {
    String cnpj = '08.974.023/0001-09';

    expect(InteraPayUtils.isValidCNPJ(cnpj), true);

    cnpj = '08974023000109';

    expect(InteraPayUtils.isValidCNPJ(cnpj), true);

    cnpj = '08974023000109921361712';

    expect(InteraPayUtils.isValidCNPJ(cnpj), false);
  });
  test('Deve retornar true caso CPF ou CNPJ for válido', () {
    String cpfCnpj = '428.379.635-26';

    expect(InteraPayUtils.isValidCpfCnpj(cpfCnpj), true);

    cpfCnpj = '08.974.023/0001-09';

    expect(InteraPayUtils.isValidCpfCnpj(cpfCnpj), true);

    cpfCnpj = '232131312311231';

    expect(InteraPayUtils.isValidCpfCnpj(cpfCnpj), false);
  });
  test('Deve retornar true caso String não for vazia', () {
    String? value = 'teste';

    expect(InteraPayUtils.isNotEmpty(value), true);

    value = '';

    expect(InteraPayUtils.isNotEmpty(value), false);

    value = null;

    expect(InteraPayUtils.isNotEmpty(value), false);
  });
  test('Deve retornar o CPF formatado caso CPF for válido', () {
    String cpf = '42837963526';

    expect(InteraPayUtils.formatarCpf(cpf), '428.379.635-26');

    cpf = '1923718931278321731283';

    expect(() => InteraPayUtils.formatarCpf(cpf), throwsA(isA<AssertionError>()));
  });
  test('Deve retornar o CNPJ formatado caso CNPJ for válido', () {
    String cnpj = '08974023000109';

    expect(InteraPayUtils.formatarCnpj(cnpj), '08.974.023/0001-09');

    cnpj = '1923718931278321731283';

    expect(() => InteraPayUtils.formatarCnpj(cnpj), throwsA(isA<AssertionError>()));
  });
   test('Deve retornar o CPF/CNPJ formatado caso CPF/CNPJ for válido', () {
    String cpfCnpj = '42837963526';

    expect(InteraPayUtils.formatarCpfCnpj(cpfCnpj), '428.379.635-26');

    cpfCnpj = '08974023000109';

    expect(InteraPayUtils.formatarCpfCnpj(cpfCnpj), '08.974.023/0001-09');

    cpfCnpj = '1923718931278321731283';

    expect(() => InteraPayUtils.formatarCnpj(cpfCnpj), throwsA(isA<AssertionError>()));
  });
}
