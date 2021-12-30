import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../Layers/Dominio/Enums/Comuns/Tema.dart';
import '../../Configuracoes.dart';

class ThemeService {
  const ThemeService._();

  static Tema get temaAtual => Configuracoes.tema;

  static Future<void> init() async {
    if (temaAtual == Tema.Dispositivo) {
      await alterarParaTemaDoDispositivo();
    }
  }

  static void _alterarTema(ThemeMode tema) => Get.changeThemeMode(tema);

  static Future<ThemeMode> obterTemaAtual() async {
    if (temaAtual == Tema.Dispositivo) return obterTemaDoDispositivo();

    return _temaToThemeMode(temaAtual);
  }

  static Future<Tema> alterarConfiguracaoDoTema(Tema tema) async {
    Configuracoes.alterarTema(tema);

    if (tema == Tema.Claro || tema == Tema.Escuro) {
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
  static ThemeMode _temaToThemeMode(Tema tema) => tema == Tema.Claro ? ThemeMode.light : ThemeMode.dark;
  // static Tema _themeMode ToTema(ThemeMode tema) => tema == ThemeMode .light ? Tema.Claro : Tema.Escuro;
}
