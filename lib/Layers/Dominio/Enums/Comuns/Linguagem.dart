enum Linguagem { PT, ID, AR, ZH, NL, FR, DE, IT, KO, EN, RU }

extension LinguagemExtension on Linguagem {
  String get name {
    switch (this) {
      case Linguagem.PT:
        return 'Português (PT)';
      case Linguagem.ID:
        return 'Indonesian (ID)';
      case Linguagem.AR:
        return 'Arabic (AR)';
      case Linguagem.ZH:
        return 'Chinese (ZH)';
      case Linguagem.NL:
        return 'Dutch (NL)';
      case Linguagem.FR:
        return 'French (FR)';
      case Linguagem.DE:
        return 'German (DE)';
      case Linguagem.IT:
        return 'Italian (IT)';
      case Linguagem.KO:
        return 'Korean (KO)';
      case Linguagem.EN:
        return 'English (EN)';
      case Linguagem.RU:
        return 'Russian (RU)';
    }
  }

  int get toIndex {
    switch (this) {
      case Linguagem.PT:
        return 0;
      case Linguagem.ID:
        return 1;
      case Linguagem.AR:
        return 2;
      case Linguagem.ZH:
        return 3;
      case Linguagem.NL:
        return 4;
      case Linguagem.FR:
        return 5;
      case Linguagem.DE:
        return 6;
      case Linguagem.IT:
        return 7;
      case Linguagem.KO:
        return 8;
      case Linguagem.EN:
        return 9;
      case Linguagem.RU:
        return 10;
      default:
        return 0;
    }
  }
}

extension LinguagemIntExtension on int {
  Linguagem get toLinguagemEnum {
    switch (this) {
      case 0:
        return Linguagem.PT;
      case 1:
        return Linguagem.ID;
      case 2:
        return Linguagem.AR;
      case 3:
        return Linguagem.ZH;
      case 4:
        return Linguagem.NL;
      case 5:
        return Linguagem.FR;
      case 6:
        return Linguagem.DE;
      case 7:
        return Linguagem.IT;
      case 8:
        return Linguagem.KO;
      case 9:
        return Linguagem.EN;
      case 10:
        return Linguagem.RU;
      default:
        return Linguagem.PT;
    }
  }
}
