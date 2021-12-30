import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ILocalStorageService.dart';
import '../../../Layers/Dominio/Enums/Comuns/Linguagem.dart';
import '../../../Layers/Dominio/Enums/Comuns/Moeda.dart';
import '../../../Layers/Dominio/Enums/Comuns/Tema.dart';
import '../../../Layers/Dominio/Enums/Comuns/TipoDeSeguranca.dart';

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
      case Linguagem:
        return ((sharedPreferences.getInt(key))?.toLinguagemEnum as T?);
      case Moeda:
        return ((sharedPreferences.getInt(key))?.toMoedaEnum as T?);
      case Tema:
        return ((sharedPreferences.getInt(key))?.toTemaEnum as T?);
      case TipoDeSeguranca:
        return ((sharedPreferences.getInt(key))?.toTipoDeSegurancaEnum as T?);
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
    else if (value is Linguagem)
      return await sharedPreferences.setInt(key, value.toIndex);
    else if (value is Moeda)
      return await sharedPreferences.setInt(key, value.toIndex);
    else if (value is Tema)
      return await sharedPreferences.setInt(key, value.toIndex);
    else if (value is TipoDeSeguranca)
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
