import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ILocalStorageService.dart';
import '../../../Layers/Dominio/Enums/Comuns/Linguagens.dart';
import '../../../Layers/Dominio/Enums/Comuns/Moedas.dart';
import '../../../Layers/Dominio/Enums/Comuns/Temas.dart';
import '../../../Layers/Dominio/Enums/Comuns/TiposDeSeguranca.dart';

class SharedPreferencesLocalStorageService implements ILocalStorageService {
  const SharedPreferencesLocalStorageService(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  T? read<T>(String key) {
    switch (T) {
      case String:
        return sharedPreferences.getString(key) as T?;
      case bool:
        return sharedPreferences.getBool(key) as T?;
      case double:
        return sharedPreferences.getDouble(key) as T?;
      case int:
        return sharedPreferences.getInt(key) as T?;
      case Linguagens:
        return ((sharedPreferences.getInt(key))?.toLinguagensEnum as T?);
      case Moedas:
        return ((sharedPreferences.getInt(key))?.toMoedasEnum as T?);
      case Temas:
        return ((sharedPreferences.getInt(key))?.toTemasEnum as T?);
      case TiposDeSeguranca:
        return ((sharedPreferences.getInt(key))?.toTiposDeSegurancaEnum as T?);
      default:
        return sharedPreferences.get(key) as T?;
    }
  }

  @override
  Future<bool> add(String key, dynamic value) async {
    if (value is String)
      return await sharedPreferences.setString(key, value);
    else if (value is bool)
      return await sharedPreferences.setBool(key, value);
    else if (value is double)
      return await sharedPreferences.setDouble(key, value);
    else if (value is int)
      return await sharedPreferences.setInt(key, value);
    else if (value is List<String>)
      return await sharedPreferences.setStringList(key, value);
    else if (value is Linguagens)
      return await sharedPreferences.setInt(key, value.toIndex);
    else if (value is Moedas)
      return await sharedPreferences.setInt(key, value.toIndex);
    else if (value is Temas)
      return await sharedPreferences.setInt(key, value.toIndex);
    else if (value is TiposDeSeguranca)
      return await sharedPreferences.setInt(key, value.toIndex);
    else
      throw AssertionError('value is not compatible with shared preferences');
  }

  @override
  Future<bool> delete(String key) async => await sharedPreferences.remove(key);

  @override
  Future<bool> deleteAll() async => await sharedPreferences.clear();

  @override
  Future<bool> deleteKeys(List<String> keys) async {
    bool result = false;
    for (var i = 0; i < keys.length; i++) {
      result = await delete(keys[i]);
    }

    return result;
  }
}

ILocalStorageService get localStorage => Get.find<ILocalStorageService>();
