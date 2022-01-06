import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:intl/intl.dart';

class InteraPayUtils {
  InteraPayUtils._();

  static final RegExp _emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static bool isValidEmail(String value) => _emailRegex.hasMatch(value);
  static bool isValidCPF(String value) => UtilBrasilFields.isCPFValido(value);
  static bool isValidCNPJ(String value) => UtilBrasilFields.isCNPJValido(value);
  static bool isValidCpfCnpj(String value) => isValidCNPJ(value) || isValidCPF(value);

  static String formatarCpf(String value) => UtilBrasilFields.obterCpf(value);
  static String formatarCnpj(String value) => UtilBrasilFields.obterCnpj(value);
  static String formatarCpfCnpj(String value) => isValidCPF(value) ? UtilBrasilFields.obterCpf(value) : UtilBrasilFields.obterCnpj(value);

  static bool isNotEmpty(String? value) => value?.isNotEmpty == true;

  static Future<void> hideKeyboard() async => await SystemChannels.textInput.invokeMethod('TextInput.hide');

  static String formatarReal(double value, {String? pattern}) => NumberFormat(pattern ?? 'R\$ #,##0.00').format(value);
  static String formatarData(DateTime value, {String? pattern}) => DateFormat(pattern ?? 'dd/MM/yyyy').format(value);
}
