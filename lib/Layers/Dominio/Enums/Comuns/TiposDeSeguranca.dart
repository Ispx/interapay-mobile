enum TiposDeSeguranca { PIN, Fingerprint, FaceId }


extension TiposDeSegurancaIntExtension on int {
  TiposDeSeguranca get toTiposDeSegurancaEnum {
    switch (this) {
      case 0:
        return TiposDeSeguranca.PIN;
      case 1:
        return TiposDeSeguranca.Fingerprint;
      case 2:
        return TiposDeSeguranca.FaceId;
      default:
        return TiposDeSeguranca.PIN;
    }
  }
}

extension TiposDeSegurancaExtension on TiposDeSeguranca {
  String get nome {
    switch (this) {
      case TiposDeSeguranca.PIN:
        return 'PIN';
      case TiposDeSeguranca.Fingerprint:
        return 'Fingerprint';
      case TiposDeSeguranca.FaceId:
        return 'Face ID';
    }
  }

   int get toIndex {
    switch (this) {
      case TiposDeSeguranca.PIN:
        return 0;
      case TiposDeSeguranca.Fingerprint:
        return 1;
      case TiposDeSeguranca.FaceId:
        return 2;
    }
  }
}