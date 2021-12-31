enum TipoDePessoa {
  Fisica, // 0
  Juridica, // 1
}

extension TipoDePessoaExtension on TipoDePessoa {
  String get name {
    switch (this) {
      case TipoDePessoa.Fisica:
        return 'Pessoa Física';
      case TipoDePessoa.Juridica:
        return 'Pessoa Jurídica';
    }
  }

  int get toIndex {
    switch (this) {
      case TipoDePessoa.Fisica:
        return 0;
      case TipoDePessoa.Juridica:
        return 1;
      default:
        return 0;
    }
  }
}

extension TipoDePessoaIntExtension on int {
  TipoDePessoa get toTipoDePessoa {
    switch (this) {
      case 0:
        return TipoDePessoa.Fisica;
      case 1:
        return TipoDePessoa.Juridica;
      default:
        return TipoDePessoa.Fisica;
    }
  }
}
