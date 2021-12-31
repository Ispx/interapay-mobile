enum Moedas { BRL, USD, JPY, RUB, EUR, WON }

extension MoedasIntExtension on int {
  Moedas get toMoedasEnum {
    switch (this) {
      case 0:
        return Moedas.BRL;
      case 1:
        return Moedas.USD;
      case 2:
        return Moedas.JPY;
      case 3:
        return Moedas.RUB;
      case 4:
        return Moedas.EUR;
      case 5:
        return Moedas.WON;
      default:
        return Moedas.BRL;
    }
  }
}

extension MoedasExtension on Moedas {
  String get nome {
    switch (this) {
      case Moedas.BRL:
        return 'Brasil (BRL)';
      case Moedas.USD:
        return 'United States (USD)';
      case Moedas.JPY:
        return 'Japan (JPY)';
      case Moedas.RUB:
        return 'Russia (RUB)';
      case Moedas.EUR:
        return 'Germany (EUR)';
      case Moedas.WON:
        return 'Korea (WON)';
    }
  }

  String get sigla {
    switch (this) {
      case Moedas.BRL:
        return 'BRL';
      case Moedas.USD:
        return 'USD';
      case Moedas.JPY:
        return 'JPY';
      case Moedas.RUB:
        return 'RUB';
      case Moedas.EUR:
        return 'EUR';
      case Moedas.WON:
        return 'WON';
    }
  }

  int get toIndex {
    switch (this) {
      case Moedas.BRL:
        return 0;
      case Moedas.USD:
        return 1;
      case Moedas.JPY:
        return 2;
      case Moedas.RUB:
        return 3;
      case Moedas.EUR:
        return 4;
      case Moedas.WON:
        return 5;
    }
  }
}
