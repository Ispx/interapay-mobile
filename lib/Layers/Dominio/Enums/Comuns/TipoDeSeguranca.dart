enum TipoDeSeguranca { PIN, Fingerprint, FaceId }

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
}
