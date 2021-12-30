abstract class ILocalStorageService {
  Object? read({required String key});
  Future<bool> add({required String key, required String value});
  Future<bool> delete({required String key});
  Future<bool> deleteAll();
}