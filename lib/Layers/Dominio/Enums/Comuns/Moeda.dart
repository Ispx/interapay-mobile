enum Moeda { BRL, USD, JPY, RUB, EUR, WON }

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
}
