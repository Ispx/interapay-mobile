import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../Layers/Dominio/Enums/Comuns/Assinatura.dart';
import '../Layers/Dominio/Enums/Comuns/Linguagem.dart';
import '../Layers/Dominio/Enums/Comuns/Moeda.dart';
import '../Layers/Dominio/Enums/Comuns/Tema.dart';
import '../Layers/Dominio/Enums/Comuns/TipoDeSeguranca.dart';
import 'Constants/LocalStoragePath.dart';
import 'Services/LocalStorage/SharedPreferencesLocalStorageService.dart';

class Configuracoes {
  const Configuracoes._();

  static Future<void> init() async {
    _obterConfiguracaoDoLocalStorage();
    assinatura = Assinatura.Gratis;
    versaoDoAplicativo = await _obterVersaoDoAplicativo();
  }

  static late String versaoDoAplicativo;
  static late Assinatura assinatura;

  static late final Rx<Moeda> _moeda;
  static Moeda get moeda => _moeda.value;
  static String get siglaMoedaTexto => moeda.sigla;
  static Future<bool> alterarMoeda(Moeda value) async {
    _moeda.value = value;

    return await localStorage.add(LocalStoragePath.MOEDA, value);
  }

  static late final Rx<Linguagem> _linguagem;
  static Linguagem get linguagem => _linguagem.value;
  static String get linguagemTexto => linguagem.name;
  static Future<bool> alterarLinguagem(Linguagem value) async {
    _linguagem.value = value;

    return await localStorage.add(LocalStoragePath.LINGUAGEM, value);
  }

  static late final Rx<Tema> _tema;
  static Tema get tema => _tema.value;
  static String get temaTexto => tema.name;
  static Future<bool> alterarTema(Tema value) async {
    _tema.value = value;

    return await localStorage.add(LocalStoragePath.TEMA, value);
  }

  static final Rxn<TipoDeSeguranca> _tipoDeSeguranca = Rxn<TipoDeSeguranca>();
  static TipoDeSeguranca? get tipoDeSeguranca => _tipoDeSeguranca.value;
  static String? get tipoDeSegurancaTexto => tipoDeSeguranca?.name;
  static Future<bool> alterarTipoDeSeguranca(TipoDeSeguranca? value) async {
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
    _moeda = (localStorage.read<Moeda>(LocalStoragePath.MOEDA) ?? Moeda.BRL).obs;
    _linguagem = (localStorage.read<Linguagem>(LocalStoragePath.LINGUAGEM) ?? Linguagem.PT).obs;
    _tema = (localStorage.read<Tema>(LocalStoragePath.TEMA) ?? Tema.Claro).obs;
    _tipoDeSeguranca.value = localStorage.read<TipoDeSeguranca>(LocalStoragePath.TIPO_DE_SEGURANCA);
    _permitirNotificacoesDasDespesas.value = (localStorage.read<bool>(LocalStoragePath.NOTICACAO_DESPESAS) ?? true);
    _permitirNotificacoesDeDicas.value = (localStorage.read<bool>(LocalStoragePath.NOTICACAO_DICAS) ?? true);
    _permitirNotificacoesGeral.value = (localStorage.read<bool>(LocalStoragePath.NOTICACAO_GERAL) ?? true);
  }

  static Future<String> _obterVersaoDoAplicativo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
