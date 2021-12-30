enum Moeda { BRL, USD, JPY, RUB, EUR, WON }

extension MoedaExtension on Moeda {
  String get name {
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
}
