enum Temas { Claro, Escuro, Dispositivo }

extension TemasIntExtension on int {
  Temas get toTemasEnum {
    switch (this) {
      case 0:
        return Temas.Claro;
      case 1:
        return Temas.Escuro;
      case 2:
        return Temas.Dispositivo;
      default:
        return Temas.Claro;
    }
  }
}

extension TemasExtension on Temas {
  String get nome {
    switch (this) {
      case Temas.Claro:
        return 'Claro';
      case Temas.Escuro:
        return 'Escuro';
      case Temas.Dispositivo:
        return 'Usar o Temas do dispositivo';
    }
  }

  int get toIndex {
    switch (this) {
      case Temas.Claro:
        return 0;
      case Temas.Escuro:
        return 1;
      case Temas.Dispositivo:
        return 2;
    }
  }
}
