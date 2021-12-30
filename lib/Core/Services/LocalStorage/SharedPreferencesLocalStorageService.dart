import 'package:shared_preferences/shared_preferences.dart';

import 'ILocalStorageService.dart';

class SharedPreferencesLocalStorageService implements ILocalStorageService {
  const SharedPreferencesLocalStorageService(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Object? read({required String key}) => sharedPreferences.get(key);

  @override
  Future<bool> add({required String key, required dynamic value}) async {
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
    else
      throw AssertionError('value is not compatible with shared preferences');
  }

  @override
  Future<bool> delete({required String key}) async => await sharedPreferences.remove(key);

  @override
  Future<bool> deleteAll() async => await sharedPreferences.clear();
}
