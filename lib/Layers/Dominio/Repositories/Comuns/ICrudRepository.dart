import '../../Entidades/Comuns/Entidade.dart';

abstract class ICrudRepository<TEntidade extends Entidade> {
  Future<List<TEntidade>> obter();
  Future<TEntidade> obterPorId(String id);
  Future<TEntidade> inserirOuAlterar(TEntidade value);
  Future<bool> deletarPorId(String id);
}