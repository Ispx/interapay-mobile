enum Moeda { BRL, USD, JPY, RUB, EUR, WON }

extension MoedaIntExtension on int {
  Moeda get toMoedaEnum {
    switch (this) {
      case 0:
        return Moeda.BRL;
      case 1:
        return Moeda.USD;
      case 2:
        return Moeda.JPY;
      case 3:
        return Moeda.RUB;
      case 4:
        return Moeda.EUR;
      case 5:
        return Moeda.WON;
      default:
        return Moeda.BRL;
    }
  }
}

extension MoedaExtension on Moeda {
  String get name {
    switch (this) {
      case Moeda.BRL:
        return 'Brasil (BRL)';
      case Moeda.USD:
        return 'United States (USD)';
      case Moeda.JPY:
        return 'Japan (JPY)';
      case Moeda.RUB:
        return 'Russia (RUB)';
      case Moeda.EUR:
        return 'Germany (EUR)';
      case Moeda.WON:
        return 'Korea (WON)';
    }
  }

  String get sigla {
    switch (this) {
      case Moeda.BRL:
        return 'BRL';
      case Moeda.USD:
        return 'USD';
      case Moeda.JPY:
        return 'JPY';
      case Moeda.RUB:
        return 'RUB';
      case Moeda.EUR:
        return 'EUR';
      case Moeda.WON:
        return 'WON';
    }
  }

  int get toIndex {
    switch (this) {
      case Moeda.BRL:
        return 0;
      case Moeda.USD:
        return 1;
      case Moeda.JPY:
        return 2;
      case Moeda.RUB:
        return 3;
      case Moeda.EUR:
        return 4;
      case Moeda.WON:
        return 5;
    }
  }
}
