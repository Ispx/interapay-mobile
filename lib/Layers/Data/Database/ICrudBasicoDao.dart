abstract class ICrudBasicoDao<TEntidade> {
  const ICrudBasicoDao._();
  
  Future<List<TEntidade>> obter();
  Future<TEntidade?> obterPorId(String id);
  Future<TEntidade> inserirOuAlterar(TEntidade pessoa);
  Future<bool> deletarPorId(String id);
}
