enum Tema { Claro, Escuro, Dispositivo }

extension TemaExtension on Tema {
  String get name {
    switch (this) {
      case Tema.Claro:
        return 'Claro';
      case Tema.Escuro:
        return 'Escuro';
      case Tema.Dispositivo:
        return 'Usar o tema do dispositivo';
    }
  }
}
