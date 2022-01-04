enum TipoDeContaBancaria {
  Corrente, // 0
  Poupanca, // 1
  Outros, // 2
}

extension TipoDeContaBancariaExtension on TipoDeContaBancaria {
  String get nome {
    switch (this) {
      case TipoDeContaBancaria.Corrente:
        return 'Conta corrent';
      case TipoDeContaBancaria.Poupanca:
        return 'Conta poupança';
      case TipoDeContaBancaria.Outros:
        return 'Outros';
    }
  }

  int get toIndex {
    switch (this) {
      case TipoDeContaBancaria.Corrente:
        return 0;
      case TipoDeContaBancaria.Poupanca:
        return 1;
      case TipoDeContaBancaria.Outros:
        return 2;
      default:
        return 0;
    }
  }
}

extension TipoDeContaBancariaIntExtension on int {
  TipoDeContaBancaria get toTipoDeContaBancaria {
    switch (this) {
      case 0:
        return TipoDeContaBancaria.Corrente;
      case 1:
        return TipoDeContaBancaria.Poupanca;
      case 2:
        return TipoDeContaBancaria.Outros;
      default:
        return TipoDeContaBancaria.Corrente;
    }
  }
}
