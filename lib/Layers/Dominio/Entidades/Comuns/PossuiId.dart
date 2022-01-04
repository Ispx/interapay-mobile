import 'package:uuid/uuid.dart';

import 'Entidade.dart';

class PossuiId extends Entidade {
  late final String _id;
  String get id => _id;

  PossuiId({String? id}) {
    if (id != null && Uuid.isValidUUID(fromString: id, validationMode: ValidationMode.strictRFC4122) == false) {
      throw AssertionError('Id deve ser um Guid, informe um Guid válido ou utilize "Uuid().v4()" para gerar o Id');
    }

    _id = id ?? Uuid().v4();
  }
}

