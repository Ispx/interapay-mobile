abstract class ILocalStorageService {
  Object? read(String key);
  Future<bool> add(String key, dynamic value);
  Future<bool> delete(String key);
  Future<bool> deleteAll();
  Future<bool> deleteKeys(List<String> keys);
}