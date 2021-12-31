import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Layers/Dominio/Enums/Comuns/Temas.dart';
import '../../Configuracoes.dart';

class ThemeService {
  const ThemeService._();

  static Temas get temaAtual => Configuracoes.tema;

  static Future<void> init() async {
    if (temaAtual == Temas.Dispositivo) {
      await alterarParaTemaDoDispositivo();
    }
  }

  static void _alterarTema(ThemeMode tema) => Get.changeThemeMode(tema);

  static Future<ThemeMode> obterTemaAtual() async {
    if (temaAtual == Temas.Dispositivo) return obterTemaDoDispositivo();

    return _temaToThemeMode(temaAtual);
  }

  static Future<Temas> alterarConfiguracaoDoTema(Temas tema) async {
    Configuracoes.alterarTema(tema);

    if (tema == Temas.Claro || tema == Temas.Escuro) {
      _alterarTema(_temaToThemeMode(tema));
    } else {
      await alterarParaTemaDoDispositivo();
    }

    return temaAtual;
  }

  static Future<ThemeMode> obterTemaDoDispositivo() async {
    final Brightness brightness = WidgetsBinding.instance!.platformDispatcher.platformBrightness;

    return _brightnessToThemeMode(brightness);
  }

  static Future<void> alterarParaTemaDoDispositivo() async {
    var temaAtualDoDispositivo = await obterTemaDoDispositivo();

    _alterarTema(temaAtualDoDispositivo);
  }

  static ThemeMode _brightnessToThemeMode(Brightness brightness) => brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  static ThemeMode _temaToThemeMode(Temas tema) => tema == Temas.Claro ? ThemeMode.light : ThemeMode.dark;
}
