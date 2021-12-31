enum Linguagens { PT, ID, AR, ZH, NL, FR, DE, IT, KO, EN, RU }

extension LinguagensExtension on Linguagens {
  String get nome {
    switch (this) {
      case Linguagens.PT:
        return 'Português';
      case Linguagens.ID:
        return 'Indonesian';
      case Linguagens.AR:
        return 'Arabic';
      case Linguagens.ZH:
        return 'Chinese';
      case Linguagens.NL:
        return 'Dutch';
      case Linguagens.FR:
        return 'French';
      case Linguagens.DE:
        return 'German';
      case Linguagens.IT:
        return 'Italian';
      case Linguagens.KO:
        return 'Korean';
      case Linguagens.EN:
        return 'English';
      case Linguagens.RU:
        return 'Russian';
    }
  }

  String get nomeComSigla {
    switch (this) {
      case Linguagens.PT:
        return 'Português (PT)';
      case Linguagens.ID:
        return 'Indonesian (ID)';
      case Linguagens.AR:
        return 'Arabic (AR)';
      case Linguagens.ZH:
        return 'Chinese (ZH)';
      case Linguagens.NL:
        return 'Dutch (NL)';
      case Linguagens.FR:
        return 'French (FR)';
      case Linguagens.DE:
        return 'German (DE)';
      case Linguagens.IT:
        return 'Italian (IT)';
      case Linguagens.KO:
        return 'Korean (KO)';
      case Linguagens.EN:
        return 'English (EN)';
      case Linguagens.RU:
        return 'Russian (RU)';
    }
  }

  int get toIndex {
    switch (this) {
      case Linguagens.PT:
        return 0;
      case Linguagens.ID:
        return 1;
      case Linguagens.AR:
        return 2;
      case Linguagens.ZH:
        return 3;
      case Linguagens.NL:
        return 4;
      case Linguagens.FR:
        return 5;
      case Linguagens.DE:
        return 6;
      case Linguagens.IT:
        return 7;
      case Linguagens.KO:
        return 8;
      case Linguagens.EN:
        return 9;
      case Linguagens.RU:
        return 10;
      default:
        return 0;
    }
  }
}

extension LinguagensIntExtension on int {
  Linguagens get toLinguagensEnum {
    switch (this) {
      case 0:
        return Linguagens.PT;
      case 1:
        return Linguagens.ID;
      case 2:
        return Linguagens.AR;
      case 3:
        return Linguagens.ZH;
      case 4:
        return Linguagens.NL;
      case 5:
        return Linguagens.FR;
      case 6:
        return Linguagens.DE;
      case 7:
        return Linguagens.IT;
      case 8:
        return Linguagens.KO;
      case 9:
        return Linguagens.EN;
      case 10:
        return Linguagens.RU;
      default:
        return Linguagens.PT;
    }
  }
}
