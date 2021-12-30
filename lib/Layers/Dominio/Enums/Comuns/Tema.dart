enum Tema { Claro, Escuro, Dispositivo }

extension TemaIntExtension on int {
  Tema get toTemaEnum {
    switch (this) {
      case 0:
        return Tema.Claro;
      case 1:
        return Tema.Escuro;
      case 2:
        return Tema.Dispositivo;
      default:
        return Tema.Claro;
    }
  }
}

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

  int get toIndex {
    switch (this) {
      case Tema.Claro:
        return 0;
      case Tema.Escuro:
        return 1;
      case Tema.Dispositivo:
        return 2;
    }
  }
}
