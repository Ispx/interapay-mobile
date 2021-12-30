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
}
