import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../Layers/Dominio/Enums/Comuns/Assinaturas.dart';
import '../Layers/Dominio/Enums/Comuns/Linguagens.dart';
import '../Layers/Dominio/Enums/Comuns/Moedas.dart';
import '../Layers/Dominio/Enums/Comuns/Temas.dart';
import '../Layers/Dominio/Enums/Comuns/TiposDeSeguranca.dart';
import 'Constants/LocalStoragePath.dart';
import 'Services/LocalStorage/SharedPreferencesLocalStorageService.dart';

class Configuracoes {
  const Configuracoes._();

  static Future<void> init() async {
    _obterConfiguracaoDoLocalStorage();
    assinatura = Assinaturas.Gratis;
    versaoDoAplicativo = await _obterVersaoDoAplicativo();
    nomeDoUsuario = 'Bernardo Veras';
  }

  static late String nomeDoUsuario;
  static double saldoDoUsuario = 0.0;

  static late String versaoDoAplicativo;
  static late Assinaturas assinatura;

  static late final Rx<Moedas> _moeda;
  static Moedas get moeda => _moeda.value;
  static String get siglaMoedaTexto => moeda.sigla;
  static Future<bool> alterarMoeda(Moedas value) async {
    _moeda.value = value;

    return await localStorage.add(LocalStoragePath.MOEDA, value);
  }

  static late final Rx<Linguagens> _linguagem;
  static Linguagens get linguagem => _linguagem.value;
  static String get linguagemTexto => linguagem.nome;
  static Future<bool> alterarLinguagem(Linguagens value) async {
    _linguagem.value = value;

    return await localStorage.add(LocalStoragePath.LINGUAGEM, value);
  }

  static late final Rx<Temas> _tema;
  static Temas get tema => _tema.value;
  static String get temaTexto => tema.nome;
  static Future<bool> alterarTema(Temas value) async {
    _tema.value = value;

    return await localStorage.add(LocalStoragePath.TEMA, value);
  }

  static final Rxn<TiposDeSeguranca> _tipoDeSeguranca = Rxn<TiposDeSeguranca>();
  static TiposDeSeguranca? get tipoDeSeguranca => _tipoDeSeguranca.value;
  static String? get tipoDeSegurancaTexto => tipoDeSeguranca?.nome;
  static Future<bool> alterarTipoDeSeguranca(TiposDeSeguranca? value) async {
    _tipoDeSeguranca.value = value;

    if (value == null) return await localStorage.delete(LocalStoragePath.TIPO_DE_SEGURANCA);

    return await localStorage.add(LocalStoragePath.TIPO_DE_SEGURANCA, value);
  }

  static final RxBool _permitirNotificacoesDasDespesas = RxBool(true);
  static bool get permitirNotificacoesDasDespesas => _permitirNotificacoesDasDespesas.value;
  static Future<bool> alterarNotificacoesDasDespesas(bool value) async {
    _permitirNotificacoesDasDespesas.value = value;

    return await localStorage.add(LocalStoragePath.NOTICACAO_DESPESAS, value);
  }

  static final RxBool _permitirNotificacoesDeDicas = RxBool(true);
  static bool get permitirNotificacoesDeDicas => _permitirNotificacoesDeDicas.value;
  static Future<bool> alterarNotificacoesDeDicas(bool value) async {
    _permitirNotificacoesDeDicas.value = value;

    return await localStorage.add(LocalStoragePath.NOTICACAO_DICAS, value);
  }

  static final RxBool _permitirNotificacoesGeral = RxBool(true);
  static bool get permitirNotificacoesGeral => _permitirNotificacoesGeral.value;
  static Future<bool> alterarNotificacoesGeral(bool value) async {
    _permitirNotificacoesGeral.value = value;

    if (value == false) {
      var future = await Future.wait([
        alterarNotificacoesDasDespesas(false),
        alterarNotificacoesDeDicas(false),
        localStorage.add(LocalStoragePath.NOTICACAO_GERAL, value),
      ]);

      return future[0] == true && future[1] == true;
    }

    return await localStorage.add(LocalStoragePath.NOTICACAO_GERAL, value);
  }

  static void _obterConfiguracaoDoLocalStorage() {
    _moeda = (localStorage.read<Moedas>(LocalStoragePath.MOEDA) ?? Moedas.BRL).obs;
    _linguagem = (localStorage.read<Linguagens>(LocalStoragePath.LINGUAGEM) ?? Linguagens.PT).obs;
    _tema = (localStorage.read<Temas>(LocalStoragePath.TEMA) ?? Temas.Claro).obs;
    _tipoDeSeguranca.value = localStorage.read<TiposDeSeguranca>(LocalStoragePath.TIPO_DE_SEGURANCA);
    _permitirNotificacoesDasDespesas.value = (localStorage.read<bool>(LocalStoragePath.NOTICACAO_DESPESAS) ?? true);
    _permitirNotificacoesDeDicas.value = (localStorage.read<bool>(LocalStoragePath.NOTICACAO_DICAS) ?? true);
    _permitirNotificacoesGeral.value = (localStorage.read<bool>(LocalStoragePath.NOTICACAO_GERAL) ?? true);
  }

  static Future<String> _obterVersaoDoAplicativo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
