enum TipoDeSeguranca { PIN, Fingerprint, FaceId }


extension TipoDeSegurancaIntExtension on int {
  TipoDeSeguranca get toTipoDeSegurancaEnum {
    switch (this) {
      case 0:
        return TipoDeSeguranca.PIN;
      case 1:
        return TipoDeSeguranca.Fingerprint;
      case 2:
        return TipoDeSeguranca.FaceId;
      default:
        return TipoDeSeguranca.PIN;
    }
  }
}

extension TipoDeSegurancaExtension on TipoDeSeguranca {
  String get name {
    switch (this) {
      case TipoDeSeguranca.PIN:
        return 'PIN';
      case TipoDeSeguranca.Fingerprint:
        return 'Fingerprint';
      case TipoDeSeguranca.FaceId:
        return 'Face ID';
    }
  }

   int get toIndex {
    switch (this) {
      case TipoDeSeguranca.PIN:
        return 0;
      case TipoDeSeguranca.Fingerprint:
        return 1;
      case TipoDeSeguranca.FaceId:
        return 2;
    }
  }
}